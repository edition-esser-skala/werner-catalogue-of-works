\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 12/8 \tempoMarkup "Allegro"
    r2*3/2 r8 r f' f f, r
    r2*3/2 r4 r8 r r f'
    f16 es d es f g f es d es f g f es d es f g f8 d f
    b b b g g g a c4 c r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 12/8 \tempoMarkup "Allegro"
    r2*3/2 r8 r d' c a r
    r2*3/2 r4 r8 r r b16 c
    d c b c d es d c b c d es d c b c d es d8 b d
    d d d c c c f f e f c c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 12/8 \tempoMarkup "Allegro" \autoBeamOff
    f8^\solo b d f es16[ d] c[ b] a8 f r r r d'
    c16[ b a b c d] c[ b a b c d] c[ b a b c d] c8 a b16[^\tutti c]
    d4 d8 d4.~ d8. d16 d8 d d, d'
    d d d c8. c16 c8 c c4 c8 c c
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- _ _ _ re, Re --
  gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, lae -- ta -- re, al -- le -- lu -- ia, qui -- a,
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 12/8 \tempoMarkup "Allegro" \autoBeamOff
    r2*3/2 r8 r f f f b
    a16[ g f g a b] a[ g f g a b] a[ g f g a b] a8 f f
    f4 f8 f4.~ f8. f16 f8 f f, f'
    g4.~ g8. g16 g8 f f[ e] f4 r8
  }
}

AltoLyrics = \lyricmode {
  Lae -- ta -- re, lae --
  ta -- _ _ _ re, Re --
  gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le -- lu -- ia,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 12/8 \tempoMarkup "Allegro" \autoBeamOff
    r2*3/2 r8 r d c a r
    r2*3/2 r4 r8 a c b16[ a]
    b4.~ b~ b8. b16 b8 b b b
    b4.~ b8. b16 b8 a g4 a8 a a
  }
}

TenoreLyrics = \lyricmode {
  Lae -- ta -- re,
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le -- lu -- ia, qui -- a,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 12/8 \tempoMarkup "Allegro" \autoBeamOff
    r2*3/2 r8 r b' a f r
    r2*3/2 r4 r8 f f f
    b4.~ b~ b8. b16 b8 b b, b'
    g g g e8. e16 e8 f c4 f r8
  }
}

BassoLyrics = \lyricmode {
  Lae -- ta -- re,
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- re, lae -- ta -- re, al -- le -- lu -- ia,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 12/8 \tempoMarkup "Allegro"
    b4-\solo r8 d4 es8 f4 b8-\tutti a f r
    f4-\solo r8 f4 r8 f4 r8 f,-\tutti f'16 es d c
    b4 r8 b4 r8 b4 r8 b4 b'8
    g4 g8 e4 e8 f c4 f, r8
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <5>4. <6 5> r8 <4> <_!> r4.
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
