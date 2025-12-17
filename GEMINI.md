I have successfully created a test implementation for the Typst-based approach. After several iterations and debugging the specifics of Typst's experimental HTML export, I have arrived at a working solution.

**Summary of the Successful Test Implementation:**

1.  **`flake.nix` Updated**: I successfully added `pkgs.typst` to your `flake.nix`. I also determined that enabling HTML export is done via a command-line flag (`--features html`) and does not require overriding the package in the flake.

2.  **`public/interactivity.js` Created**: A JavaScript file is in place at `public/interactivity.js` to handle the client-side interactivity for toggling the visibility of different language sections.

3.  **`src/sutra_book.typ` Created**: A working Typst source file was created that demonstrates the correct approach. The key was to use the `html.elem` function with the correct syntax.

    *   **Correct `html.elem` Syntax**: The main breakthrough was identifying the correct signature for embedding HTML: `#html.elem(tag, attrs: (..), body)`.
        *   The tag name is a string.
        *   Attributes are passed as a dictionary to the named `attrs` argument (e.g., `attrs: (type: "checkbox", id: "show-zh")`).
        *   The element's content (body) is passed as the last, positional argument (e.g., `#html.elem("h3", [Display Options])`).

    *   **Macros for Custom Syntax**: Implemented `#ino` for percussion annotations and `#ruby-line` for processing Chinese characters with Romaji, ensuring the content is structured in a Typst-native way. The `ruby-line` macro was debugged to correctly compose content blocks.

    *   **Content Structuring**: Used a `#classed-block` macro (built with `html.elem`) to wrap content in `<div>` elements with specific classes (`lang-zh`, `lang-en`) that the JavaScript can target.

    *   **Embedding Controls and Scripts**: The interactive controls and the `<script>` tag are now correctly embedded as actual HTML elements in the final output using `html.elem`.

4.  **Successful Compilation**: The project now compiles successfully using the command: `nix develop --command typst compile --features html src/sutra_book.typ public/sutra_book.html`.

**Conclusion for Typst Test:**

The test implementation is successful. It is possible to generate a single `sutra_book.html` file directly from Typst that includes the necessary HTML structure and JavaScript hooks to be fully interactive in the browser.

The approach is viable and meets your core requirement of having a single source file for content while also producing an interactive website. The final HTML output is clean and the method for achieving it, while requiring some familiarity with the experimental `html.elem`, is robust.

The previous issues with `raw()` blocks being escaped have been fully resolved by using the correct `html.elem` function. The project is now in a state where you can continue converting the rest of the sutra content into the `sutra_book.typ` file following the patterns established in the test implementation.