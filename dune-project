(lang dune 3.16)

(name comparison)

(generate_opam_files true)

(package
 (name comparison)
 (depends
  (ocaml (= 5.1.0))
  dune
  dream
  dream-html
  ocaml-lsp-server
  ocamlformat

  (alcotest :with-test)
  (bisect_ppx (and :with-test (>= 2.5.0)))  ; --instrument-with.
  (ppx_expect (and :with-test (>= v0.15.0) (< v0.17.0)))
  (ppx_yojson_conv :with-test)

  tyxml
  tyxml-ppx
  tyxml-jsx

  mlx
  html_of_jsx

  (odoc :with-doc)
 ))

(dialect
 (name eml)
 (implementation
  (extension eml)
  (preprocess
   (run dream_eml --stdout %{input-file}))))

(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess
   (run mlx-pp -print-ml %{input-file}))))
