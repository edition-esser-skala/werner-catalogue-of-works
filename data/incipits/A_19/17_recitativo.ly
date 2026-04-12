\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "ardito"^\markup \remark "Jahel" c' f c c g r r16 a
    b8 b16 d c8 g a a r a
    e'16 e e16. e32 e16 cis a b g8 g r16 g g a
    b8. b16 b8 a f f r a
    f'8. f16 f8 d c! g b16 d c g
  }
}

SoliLyrics = \lyricmode {
  Er -- freu -- te Hoff -- nung! du
  haſt mich nicht hin -- ter -- gan -- gen, Ich
  ßeh den Si -- se -- ra in ei -- nen ban -- gen, und forcht -- ge --
  jag -- ten Lau -- fe ir -- ren, der
  Him -- mel ſoll ihn nun zu mei -- ner Hüt -- te
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a'2 e
    e f8. c16 a8 f
    cis'2 cis~
    cis d
    d e
  }
}

BassFigures = \figuremode {
  <6>2 q
  <5->1
  <6>2 <5>
  <7->1
  r2 <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
