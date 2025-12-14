\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c' e16. f32 g16. a32 h16 a32 g c16. c32 h16. a32 g16. f32 e16. d32
    e16. g32 c8~ c16. g32 e16. c32 a16. f32 a'8~ a16. f32 d16. h32
    g16. e32 g'8~ g16. e32 c16. a32 f16. d32 f'8~ f16. d32 h16. g32
    e16. c32 e16. f32 g16. g32 a16. h32 c16. a32 c16. d32 e16. e32 f16. g32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c' e16. f32 g16. a32 h16 a32 g c16. c32 h16. a32 g16. f32 e16. d32
    e16. g32 c8~ c16. g32 e16. c32 a16. f32 a'8~ a16. f32 d16. h32
    g16. e32 g'8~ g16. e32 c16. a32 f16. d32 f'8~ f16. d32 h16. g32
    e16. c32 e16. f32 g16. g32 a16. h32 c16. a32 c16. d32 e16. e32 f16. g32
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4^\tutti g c,8 d16 e d8 d16 d
    e8 e r c4 a8 r h~
    h g r a4 f8 r g
    g g r g c c r c
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de, se --
  de, se -- de a
  dex -- tris, a dex -- tris, a
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4.^\tutti g8 a a16 a d,8 g16 g
    g8 g r4 r8 f4 d8
    r e4 c8 r d4 h8
    r c g' g r e g g
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de,
  se -- de, se -- de
  a dex -- tris, a dex -- tris,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti d e8 d16 c h8 d16 d
    c8 c g4 a d
    g, c f, g
    e r8 d' e e r e
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me -- _
  is, a dex -- tris, a
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4^\tutti h a8 a16 a h8 h16 h
    c8 c, e4 f d
    e c d h
    c r8 h' a a r g
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me -- _
  is, a dex -- tris, a
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' h h, a4 h
    c e f d
    e c d h
    c8 c' h4 a g
  }
}

BassFigures = \figuremode {
  r1
  r2. <5>8 <6>
  <5> <6> <5> <6> <5> <6> <5> <6>
  r2. <6 4>4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
