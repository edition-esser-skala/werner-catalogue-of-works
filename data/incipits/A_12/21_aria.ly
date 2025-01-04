\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d4\f d' cis8( h) a h
    a g fis e fis16( e) d( cis) d4 \gotoBar "9"
    d4 r r2
    r r8 d'16\p e fis g a8 %10
    h4 r r2
    r r8 a a16(\trill g) a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d4\f d' cis8( h) a h
    a g fis e fis16( e) d( cis) d4 \gotoBar "9"
    d4 r r2
    R1 %10
    r8 e16\p fis g a h8 a4 r
    r2 r8 a' a16(\trill g) a8
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2 \gotoBar "9"
    d4 d' cis8[ h] a[ h]
    a[ g] fis[ e] fis16[ e d8] d4
    h'4. cis8 d[ a] h[ fis]
    g[ a16 h] a8 g fis4 r
  }
}

SoliLyrics = \lyricmode {
  Erd, er -- öff -- ne
  dei -- nen Ra -- chen,
  ſchluckh mich in die
  küh -- _ le Schooß,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d8\f d' fis, d a'4. h8
    a g fis e d d' d, e \gotoBar "9"
    d8\p d' fis, d a'4. h8
    a g fis e d d' fis, d
    g, g' fis e fis4 d
    e cis d8 fis' e d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r4. <6>8 q4 q
  r q2.
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
        \set Staff.instrumentName = \markup \center-column { "Jobs" "Frau" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
