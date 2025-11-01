\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    R2*3
    r8 a'\f d4~
    d16 cis h8 g'16 fis e8~
    e16 d cis8 a'16 g fis8~
    fis16 e d8 h'16 a g fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    R2*3
    r8 a' d4~
    d16 cis h8 g'16 fis e8~
    e16 d cis8 a'16 g fis8~
    fis16 e d8 h'16 a g fis
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 2/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 a^\solo d cis
    d d, d'4~
    d8 cis16[ h] a[ g fis e]
    fis8 d r4
    R2*3
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  sal -- ve, sal --
  ve ma --
  _ ter,
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4. e8
    fis4. g8
    a4 a,
    d r8 fis
    g8.[ fis16 e8. g16]
    a8.[ g16 fis8. a16]
    h8. a16 g4
  }
}

BassFigures = \figuremode {
  r2
  r
  <4>4 <3>
  r2
  r
  r
  r4 <5>8 <6>
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
