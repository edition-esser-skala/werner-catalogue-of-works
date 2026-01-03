\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    \partial 4 r4 R1
    r8 a' d a fis' d a' fis
    e a16 gis a8 e cis e a, cis
    e, e'16 d e8 cis a cis e, a
    cis,2 r
    r8 a' cis a e' cis g'! e
    fis a16 g a8 fis d fis16 e fis8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    \partial 4 r4 R1
    r8 fis a fis d' a fis' d
    cis e16 d e8 cis a cis e, a
    cis, cis'16 h cis8 a e a cis, e
    a,2 r
    r8 e' a e cis' a e' cis
    d fis16 e fis8 d a d16 cis d8 a
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \partial 4 a4 d2 a
    fis d
    a' r
    r r4 a
    e'2 cis
    a g'
    fis r
  }
}

SoliLyrics = \lyricmode {
  Ver -- ma -- le --
  dey -- ter
  Geitz!
  der
  du mich
  al -- ler --
  ſeits
}

Continuo = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    \partial 4 a'4 d2 a
    fis d
    a' r
    R1
    a,2 a'
    cis, a
    d r
  }
}

BassFigures = \figuremode {
  r4 r1
  r
  r
  r
  r
  r2 <7>
  r1
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
        \set Staff.instrumentName = "Judas"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
