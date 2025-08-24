\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Tempo giusto"
    fis'16(\p e) fis8 r4 r
    r8 d4 e16 d e8 h
    r cis4 d16 cis d8 a
    r h4 cis16 d e8 cis
    a4 r r
    R2.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Tempo giusto"
    d'16(\p cis) d8 r4 r
    r r8 e,16 fis g a h8~
    h e, r d16 e fis g a8~
    a d, r e4 a8~
    a fis d4 r
    R2.
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key h \minor \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    r4 fis,8.[^\solo gis32 ais] h8[ cis]
    \tuplet 3/2 8 { d16[ cis h] } h8 r h g'32[ fis e8 d16]
    \tuplet 3/2 8 { cis16[ h a] } a8 r a fis'32[ e d8 cis16]
    h[ a] h8 r h a8. g16
    fis8 a d2~
    d8[ cis16 h] a4 g\trill
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  _ nit, qui ve --
  _ nit in no -- mi --
  ne, in no --
  _ "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key h \minor \time 3/4 \tempoMarkup "Tempo giusto"
    h8-\solo h'16 ais h8 fis d ais
    h h'16 a h8 g e g
    a, a'16 g a8 fis d fis
    g, g'16 fis g8 e cis a
    d d'16 cis h8 fis h a16 g
    fis8 e16 d cis8 h16 a h8 cis
  }
}

BassFigures = \figuremode {
  r4. <_+>8 <6>4
  r4. <6>
  <9>8 <8>4 <6>4.
  <9>8 <8>4 <6\\>4.
  r2.
  <6>8 <6\\>16 <6> <6>4 q
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
