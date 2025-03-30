\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  c8.^\partAs d16 e[ f] g8 f8. g16 e8 a
  h c f,8. f16 e4 \clef soprano a8^\partSs d
  d d16 c h8 a16 g fis8 g g[ fis]
}

text = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti me, et
  co -- gno -- vi -- sti me, et fu --
  ni -- cu -- lum me -- um in -- ve -- sti -- "ga -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
