\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c'' c h c4 r16 g, a h
    c e d f e g f a g8 f16 e d4
    g, r16 g a h c e d f e g f a
    g8 f16 e d4 g,8 g'~ g a16 h
    c8 c,4 h8 c c16 d e fis g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 e'16 f g8 d e d16 c h8 a
    g4 c c h8 c16 d
    e8 d16 c h8 a g4 g
    r8 c h c16 d e8 d16 c h8 a
    g a d, g e g~ g16 a h c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 e'16[^\tutti f] g8 d e4 r
    r c c h8[ c16 d]
    e8 d16[ c h8] a g4 g
    r8 c h c16[ d] e8[ d16 c] h8[ a]
    g a16 a g8. g16 g4 r
  }
}

SopranoLyrics = \lyricmode {
  Lae -- ta -- tus sum
  in his quae
  di -- cta __ sunt mi -- hi:
  In do -- mum Do -- _
  _ mi -- ni i -- bi -- mus.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 g'^\tutti g g g4 r
    r g g g
    g8 g4 a16[ h] c4 c,
    r8 a' g4 g8 g4 a16[ h]
    c8 f,16 f d8. c16 c4 r
  }
}

AltoLyrics = \lyricmode {
  Lae -- ta -- tus sum
  in his quae
  di -- cta sunt mi -- hi:
  In do -- mum Do -- _
  _ mi -- ni i -- bi -- mus.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 c^\tutti c h c4 r
    r e e d
    c d8 d e4 e8 f
    g[ f16 e] d4 c d
    e8 c4 h8 c4 r
  }
}

TenoreLyrics = \lyricmode {
  Lae -- ta -- tus sum
  in his quae
  di -- cta sunt mi -- hi: In
  do -- mum Do -- mi --
  ni i -- bi -- mus.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 c^\tutti e g c4 r
    r c c g8[ a16 h]
    c8 h16[ a g8] f e[ d] c d
    e f g[ a16 h] c8[ h16 a] g8 f16 f
    e8[ f] g8. g16 c,4 r
  }
}

BassoLyrics = \lyricmode {
  Lae -- ta -- tus sum
  in his quae
  di -- cta __ sunt mi -- hi: In
  do -- mum Do -- _ _ mi -- ni
  i -- _ bi -- mus.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c-\tutti e g c h16 a g8 f
    e d c d e f g a16 h
    c8 h16 a g8 f e d c d
    e f g a16 h c8 h16 a g8 f
    e f g g, c c' h a
  }
}

BassFigures = \figuremode {
  r1
  r
  r1
  r
  r4 <4>8 <3> r2
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
