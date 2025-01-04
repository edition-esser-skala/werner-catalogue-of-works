\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b'4~ \sbOn \tuplet 3/2 8 { b16 d f } f,16. a32 b4~ \tuplet 3/2 8 { b16 f' b } b,16. d32 \sbOff
    g32( b16.) a32( g16.) f32( es16.) d32( es16.) \grace es8 d4 f8 \tuplet 3/2 8 { g16 a b } \gotoBar "6"
    b,4 r r8 b'4\p b,8\trill
    \tuplet 3/2 8 { c16 d es d es f } \grace f8 es4\trill \tuplet 3/2 8 { d16 b f b f d } b4 \sbOff
    r2 r8 f'' f, d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b'4~ \sbOn \tuplet 3/2 8 { b16 d f } f,16. a32 b4~ \tuplet 3/2 8 { b16 f' b } b,16. d32 \sbOff
    g32( b16.) a32( g16.) f32( es16.) d32( es16.) \grace es8 d4 f8 \tuplet 3/2 8 { g16 a b } \gotoBar "6"
    b,4 r r2
    r8 a\p \tuplet 3/2 8 { \sbOn b16 c d c d es d b f b f d } b4 \sbOff
    r2 r8 a'16 b c8 b
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Andante"
    d8 f16. es32 d8 c d16. b32 d16. es32 f8 d16. f32
    b,8 es c f~ f d16. c32 b8 d \gotoBar "6"
    b4 r r2
    R1*2
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2 \gotoBar "6"
    r8 f4 f,8 b16[ a] b4.
    \tuplet 3/2 8 { c16[ d es] d[ es f] } \grace f8 es4 d f8 es16[ d]
    c[ g'] f[ es] d[ c] b8 b\trill a f' d
  }
}

SoliLyrics = \lyricmode {
  Gro -- ßer Her -- ſcher,
  dei -- ne Gna -- de, die du
  pfle -- geſt auß -- zu -- thei -- len, ſein "zu -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b8 d'16. c32 b8 a g f16. es32 d8 g16. f32
    es8 c' a f b b,16. c32 d8 b \gotoBar "6"
    b d'16.\p c32 b8 a g, g'16. f32 g8 d
    es f g a b b,16 c d8 b
    es4 r8 e f f,16 g a8 b
  }
}

BassFigures = \figuremode {
  r1
  r
  r2.. <6>8
  q q q <5> r2
  <6>4. <5>8 <4> <3>4.
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Job"
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
