\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 6/8 \tempoMarkup "Allegro / Allegretto / Larghetto"
    \partial 8 g'8-\pizz c8. d16 c8 c8. e16 g8
    c,4 c8 c4 a'8 \gotoBar "8"
    h,8. g16 d8 h4 r8
    r4 r8 r r g''
    a8. g16 f8 e8. d16 c8
    r4 r8 r r d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 6/8 \tempoMarkup "Allegro / Allegretto / Larghetto"
    \partial 8 g'8-\pizz e8. f16 e8 e8. c'16 d8
    c8. h16 a8 g8. c16 a8 \gotoBar "8"
    g8. d16 h8 g4 r8
    r4 r8 r r g''
    a8. g16 f8 e8. d16 c8
    r4 r8 r r d
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 6/8 \autoBeamOff \tempoMarkup "Allegro / Allegretto / Larghetto"
    \partial 8 r8 R2.*2 \gotoBar "8"
    r4 r8 r r g
    c8.[ d16] c8 c8.[ d16] c8
    c4.\trill c4 c8
    d([ e)] f e16([ d c8)] h
  }
}

SoliLyrics = \lyricmode {
  Ô
  bel -- la Mar -- ga --
  ri -- ta ô
  la -- ſcia far pur
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 6/8 \tempoMarkup "Allegro / Allegretto / Larghetto"
    \partial 8 r8 c4 r8 c'4 h8
    a8. g16 f8 e4 f8 \gotoBar "8"
    g,4 r8 g'8. f!16 e d
    c4 h8 a4 e'8
    f4 g8 a4 e8
    f4 d8 g4 g,8
  }
}

BassFigures = \figuremode {
  r8 r2.
  r
  r
  r
  r
  <6>4. <6 4>4 <5 3>8
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
        \set Staff.instrumentName = "Savoiard"
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
