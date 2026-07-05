\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro molto"
    d16.\f fis32 a16. d32 a16. cis32 e16. g32 fis16. d32 a16. fis32 d16. a''32 a16. a32
    \sbOn \tuplet 3/2 8 { h16 a g fis e d } \sbOff cis16. e32 d16. fis32 e16. a,32 e16. cis32 a16. e''32 e8\trill \gotoBar "7"
    d,4 r r16 fis\p g16. d32 a'16. d32 fis16. a32
    a,8 e a, r d16. fis32 a16. d32 fis,16. a32 d16. fis32
    d,4 r h'16 d32( cis) h16 a g h32( a) g16 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro molto"
    d16.\f fis32 a16. d32 a16. cis32 e16. g32 fis16. d32 a16. fis32 d16. a''32 a16. a32
    \sbOn \tuplet 3/2 8 { h16 a g fis e d } \sbOff cis16. e32 d16. fis32 e16. a,32 e16. cis32 a16. e''32 e8\trill \gotoBar "7"
    d,4 r r16 fis\p g16. d32 a'16. d32 fis16. a32
    a,8 e a, r d16. fis32 a16. d32 fis,16. a32 d16. fis32
    d,4 r h'16 d32( cis) h16 a g h32( a) g16 fis
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Allegro molto" \autoBeamOff
    R1*2\gotoBar "7"
    d4 a \tuplet 3/2 8 { fis16[ e d] } r8 r fis'
    \sbOn \tuplet 3/2 8 { e16[ d cis d cis h] cis[ h a] h[ a g] } \appoggiatura g8 fis4 a~
    a8 h16[ cis] d[ a] fis[ d] h'8. a16 g4
  }
}

SoliLyrics = \lyricmode {
  Feur und Schwerd mein
  Rach __ _ be -- gerth, Schwe --
  fel ſoll zu di -- ſer Stund
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro molto"
    d8 fis cis a d e fis d
    g h a fis cis8. h16 cis8 a \gotoBar "7"
    d, fis' cis a d e fis d
    cis4 r8 a d4 r8 e
    fis4 d g8 a h a
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <6>
  r
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
        \set Staff.instrumentName = "Gerecht."
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
