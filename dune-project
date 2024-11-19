(lang dune 3.16)

(name comparison)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name comparison)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
  (ocaml (= 5.1.0))
  dune
  dream
  dream-html
  (ocaml-lsp-server :dev)
  (ocamlformat :dev)

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
 )
 (tags
  (topics "to describe" your project))
 (allow_empty))

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

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
