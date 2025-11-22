\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Tempo passato"
    r4 r8 f'~
    f16 e e,8 r e'~
    e16 d d,8 r d'~
    d16 c e,8 r4
    R2
    \tuplet 3/2 8 { g'!16 g g g[ g g] g g g g[ g g] }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Tempo passato"
    \tuplet 3/2 8 { c'16 c c c[ c c] c c c c[ c c]
    h h h h[ h h] h h h h[ h h]
    a a a a[ a a] a a a a[ a a]
    gis h a \hA gis[ fis e] a h c h[ c d]
    c d e e[ f! g!] a g f } e[ dis]
    e8 e, r c'
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Tempo passato"
    a'8 c f a,
    gis h e g,
    fis a d f,
    e d c gis
    a a'16. g!32 f8 fis
    e g c e,
  }
}

BassFigures = \figuremode {
  r4. <6>8
  <7>16 <6> r4 q8
  <7>16 <6> r4 q8
  <7 _+>16 <6> <\t>8 <6>4
  r <7>8 q16 <6\\>
  <_!>4. <6>8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
