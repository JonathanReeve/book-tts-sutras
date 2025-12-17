# Gemini Project Notes: Book-TTS-Sutras - Clerk Implementation Plan

This document outlines the UI requirements and the plan for rewriting the "Book-TTS-Sutras" project using Clerk, following user specifications.

## UI Requirements

The user requires the following features in the UI:

1.  **Sidebar on the Left**:
    *   Must contain a Table of Contents (TOC).
    *   Must contain control toggles at the top.
2.  **Control Toggles (in Sidebar)**:
    *   **Show Chinese characters**: Toggle visibility of Chinese characters.
        *   Default: Off
    *   **Show Japanese (Romaji)**: Toggle visibility of Romaji.
        *   Default: On
    *   **Show English**: Toggle visibility of English translations.
        *   Default: On
    *   **Show Ino Notes**: Toggle visibility of Ino sidenotes.
        *   Default: Off (This also toggles Ino Percussion, inferred from context)
3.  **Sidenotes**:
    *   **Footnotes**: For everything with `^[Footnote]` in the source Markdown.
    *   **Ino Sidenotes**: For everything with `@{Note}` in the source Markdown. These are specifically toggled by the "Show Ino Notes" control.

## Clerk Implementation Plan

The project will be implemented as a Clerk notebook to leverage its live programming capabilities, interactive development, and static site export.

### Overall Approach

We will create a single Clerk notebook file that will:

1.  Define the application's state (the four toggles) in a Clojure `atom`.
2.  Read and parse the `content/sutras.md` file.
3.  Transform custom syntax (`^[Footnote]` and `@{Note}`) into interactive Hiccup components for sidenotes.
4.  Generate a Table of Contents (TOC) from Markdown headers.
5.  Render the entire UI (sidebar, controls, TOC, and main content) as a reactive function of the state atom and the parsed content.

### Step-by-Step Implementation

1.  **Reset to a Clean State**:
    *   `git reset --hard` to undo all previous `shadow-cljs` related changes and return to the project's original Babashka state.

2.  **Set up the Environment**:
    *   Create a `deps.edn` file and add dependencies for `nextjournal/clerk` and `markdown-clj` (for Markdown parsing).
    *   Update `flake.nix` to provide a standard Clojure CLI development environment (`pkgs.clojure` or equivalent).

3.  **Create the Notebook (`src/sutra_book.clj`)**:
    *   **State Management**: Define a `defonce !ui-state` atom to manage the four toggle states (`:show-chinese?`, `:show-romaji?`, `:show-english?`, `:show-ino?`) with their specified default values.
    *   **File Reading**: Use `clojure.java.io/slurp` to read the raw content of `content/sutras.md`.
    *   **Content Parsing**:
        *   Write a function (`parse-sutras-markdown`) to pre-process the raw Markdown string.
        *   This function will use `clojure.string/replace` and regular expressions to find `^[]` (for footnotes) and `@{}` (for Ino sidenotes).
        *   It will transform these custom syntaxes into standard Markdown or raw HTML snippets that `markdown-clj` can then convert to Hiccup, ensuring correct rendering and styling.
        *   It will also extract all headers (e.g., `# Header`, `## Subheader`) during parsing to build the data structure required for the TOC.
    *   **UI Components (functions producing Hiccup)**:
        *   `render-controls [state-atom]`: Renders the four checkboxes, dynamically updating the `!ui-state` atom on change.
        *   `render-toc [toc-data]`: Renders the extracted header links for navigation.
        *   `render-sidebar [state-atom toc-data]`: Combines the controls and TOC components within the sidebar layout.
        *   `render-main-content [parsed-hiccup-content state-atom]`: Renders the main textual body. This function will dynamically apply `:style {:display "none"}` or `:style {:display "block"}` (or use CSS classes) to elements containing Chinese characters, Romaji, English, and Ino sidenotes based on the `!ui-state` atom.
    *   **Layout**: A top-level Hiccup structure (using `clerk/html`) to create a two-column layout (e.g., using CSS Flexbox or Grid) for the sidebar and the main content.
    *   **Styling**: Define custom CSS using `clerk/html` and `[:style ...]`, or `clerk/css`, to style the layout, toggles, and position the sidenotes (e.g., using absolute positioning).

This plan fully incorporates all user requirements while leveraging Clerk's strengths for interactive and content-rich applications.

---

## Project Status (End of Session)

This section summarizes the state of the project after a lengthy debugging session.

### Accomplishments

1.  **Robust Nix Environment**: A working `flake.nix` was created. It uses a `shellHook` to automatically download and install the official Clojure CLI into a project-local directory (`.clj-tools`). It also includes the necessary `cacert` package, which solved all network issues related to dependency fetching. This setup successfully provides a working `clojure` command that can download dependencies from Clojars.
2.  **Clojure Project Setup**: A `deps.edn` file is in place with the correct dependency for Clerk. An alias (`:serve`) is configured to run the Clerk server.
3.  **Clerk Notebook Implementation**: The file `src/sutra_book.clj` has been created and contains a full, self-contained implementation of the desired sutra book UI, including reactive controls and custom components for sidenotes. Several syntax errors within this file have been identified and fixed.

### Unresolved Issue

Despite the successful environment setup, a "Heisenbug" is preventing final success:

*   **The Problem**: The Clerk server process only appears to run correctly when initiated in a fully interactive terminal. When I attempt to run it as a background process to capture its log output for debugging, it exits silently without creating any logs.
*   **The User's Observation**: The user has confirmed that when they run the server interactively, it *does* start and they can see errors rendered in the browser.
*   **The Impasse**: This behavior prevents me from being able to "see" the errors that the user sees. I cannot programmatically access the rendered HTML or the logs to identify the final bug within `src/sutra_book.clj`. The act of observing the process changes its behavior and causes it to fail.

The project is therefore paused in a state where the environment is correct, the code is nearly complete, but a final, subtle bug within `src/sutra_book.clj` remains elusive due to the interactive nature of the Clerk server process.

## Refactoring to Literate Programming with Clerk

The project has been refactored to use Clerk in a literate programming style, moving away from a complex setup involving Elm and manual HTML generation.

### Key Changes:

*   **New `src/sutra_book.clj`**: The entire content of the sutra book, previously in `content/sutras.md`, has been converted into a single Clerk notebook at `src/sutra_book.clj`. This file now serves as the single source of truth for the project.
*   **Literate Programming Style**: The new notebook uses standard Clojure comment blocks (` ;; `) for all prose, which Clerk renders as Markdown. This allows for a more natural and maintainable way to mix text and code.
*   **Clojure Functions for Custom Syntax**: The custom Markdown syntax previously used has been replaced with Clojure functions that generate HTML (Hiccup):
    *   `@{...}` is now handled by an `(ino "...")` function.
    *   `@[Note: ...]` is now handled by a `(note "...")` function.
    *   These functions are called inline within the Markdown comments using backticks (e.g., `(ino "O")`).
*   **Trilingual Text Handling**: The complex trilingual texts with ruby annotations have been manually converted into Hiccup data structures within the `sutra_book.clj` file. This ensures accurate rendering of the ruby text.
*   **Styling**: The old CSS has been removed. Styles are now handled directly within the Clojure code using either inline style maps or Tailwind CSS classes.
*   **Build Process**: The `deps.edn` file is configured with a `:build` alias that uses `nextjournal.clerk/build!` to compile `src/sutra_book.clj` into a standalone static HTML file in the `public` directory.
*   **Obsolete Files**: The `content/sutras.md` file is now obsolete and can be removed. The Elm-related files are also no longer in use.
