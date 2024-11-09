\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    r8 f' a, b c4 f g e
    r8 f a, b c4 f g e
    r8 f a, b c4 g' c, a'
    g2 r8 g e f g4 e
    c a r8 a' f g a4 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    r4 f2 a4 g c
    a f2 a4 g c
    a f2 c'4 a f'
    e g, c2. c4
    a f2 a4 d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    c'2^\tutti c c
    c r4 c c c
    c2 c4 c c2
    c4 g c2. c4
    a4. a8 a4 a d d
  }
}

SopranoLyrics = \lyricmode {
  Lae -- ta -- tus
  sum in his, quae
  di -- cta sunt mi --
  hi: In do -- mum
  Do -- mi -- ni, in do -- mum
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 f^\tutti g e
    f2 r4 f g e
    f2 f4 g f2
    e r4 e g e
    f4. f8 f4 f a f
  }
}

AltoLyrics = \lyricmode {
  Lae -- ta -- tus
  sum in his, quae
  di -- cta sunt mi --
  hi: In do -- mum
  Do -- mi -- ni, in do -- mum
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 a^\tutti g c
    a2 r4 a g c
    a2 a4 g a2
    g r4 c c c
    c4. c8 c4 d a a
  }
}

TenoreLyrics = \lyricmode {
  Lae -- ta -- tus
  sum in his, quae
  di -- cta sunt mi --
  hi: In do -- mum
  Do -- mi -- ni, in do -- mum
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 f^\tutti e c
    f2 r4 f e c
    f2 f4 e f2
    c r4 c e c
    f4. f8 f4 d f d
  }
}

BassoLyrics = \lyricmode {
  Lae -- ta -- tus
  sum in his, quae
  di -- cta sunt mi --
  hi: In do -- mum
  Do -- mi -- ni, in do -- mum
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    f4.-\tutti g8 a4 f e c
    f4. g8 a4 f e c
    f4. g8 a4 e f f,
    c'2 r4 c e c
    f2. d4 f d
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
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
