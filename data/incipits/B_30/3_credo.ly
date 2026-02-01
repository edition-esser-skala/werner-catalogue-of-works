\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    e16 f g f e4 c'
    h16 c d e d4 g
    e16 f g f e4 c'
    a16 g f e f4 r8 c
    f16 g a g f4 d'
    h,16 c d c h4 g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    e16 f g f e4 c'
    h16 c d e d4 g
    e16 f g f e4 c'
    a16 g f e f4 r8 c
    f16 g a g f4 d'
    h,16 c d c h4 g'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e'^\tutti e
    d g g
    e e r8 g
    c,4 c4. d16[ e]
    f8 d16[ e] f8[ e] d[ c]
    h4 h8[ d] c d
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem, fa --
  cto -- rem __ _
  coe -- li __ _ et
  ter -- rae, vi -- "si -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'^\tutti g
    g g g
    g g c8[ b]
    a4 f8[ g] a[ g]
    f4. a8 g4
    g g g8 a16[ h]
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem, fa --
  cto -- rem coe --
  li __ _ et
  ter -- rae, vi -- "si -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c^\tutti c
    h d d
    c c r8 e
    f[ c] c2
    d8[ a] a4 r8 c
    d4 d g8 f
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem, fa --
  cto -- rem
  coe -- li et
  ter -- rae, vi -- "si -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c'^\tutti c,
    g' h8[ g] a[ h]
    c4 c, r8 e
    f4. g8 f[ e]
    d f16[ e d8] c h[ a]
    g4 g'8[ f] e[ d]
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem, fa --
  cto -- _ rem
  coe -- li __ et ter --
  rae, vi -- "si -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
    c16-\tutti d e d c8 d e f
    g16 a h c h8 g a h
    c16 d e d c8 b a g
    f16 g a b a8 g f e
    d16 e f e d8 c h! a
    << { g'16 a h a } \\ { g,8 } >> g'8 f e d
  }
}

BassFigures = \figuremode {
  %tacet
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
