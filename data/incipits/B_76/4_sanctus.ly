\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Molto andante"
    g'4.-!-\tutti fis8-! << {
      d'4. cis8
      d a d c
    } \\ {
      g4 e
      d2
    } >> e4. d16 c
    h4 c d e
    fis8 e16 fis g8 fis16 g e8 a fis d
    a2 << {
      d'8 \clef alto e16[ fis] g8 fis16 g
      a8 h c! h16 a h8
    } \\ {
      d,,8 cis'16[ d] e8 d16 e
      fis8 e16 d e8 fis g
    } >> \clef bass g, a g16 a
  }
}

BassFigures = \figuremode {
  r1
  r2 <3 5>
  <6>4 <9>8 <8>4. <7>8 <6\\>
  r2 <6\\>8 <_+>4.
  <4>4 <_+>2.
  r <6\\>8 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
