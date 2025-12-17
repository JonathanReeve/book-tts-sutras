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
