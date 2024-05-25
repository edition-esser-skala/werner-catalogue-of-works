\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r8 g''16 g g8 c c h
    c g16 g g8 c c h
    c g16 g g8 c c h
    c[ h] c g4 c8
    h16 d g, h d, g h, d g, h d, g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r8 e'16 d e8 e e d
    e e16 d e8 e e d
    e e16 d e8 e e d
    e d c e c e
    d16 h' d, g h, d g, h d, g h, d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    c'16[^\tutti d e d] e4. d16 d
    e8. e16 e4 e8 d
    e8. e16 e4 e8 d
    e d16 d c4. e8
    d8. d16 d4 r
  }
}

SopranoLyrics = \lyricmode {
  Glo -- _ ri -- a,
  glo -- ri -- a in al --
  tis -- si -- mis, in al --
  tis -- si -- mis De -- o
  glo -- ri -- a,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    g'8.^\tutti g16 g8 g4 g16 g
    g8. g16 g4 g8 g
    g8. g16 g8 g4 g8
    g g16 g g4. g8
    g8. g16 g4 r
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a, glo -- ri -- a,
  glo -- ri -- a in al --
  tis -- si -- mis, in al --
  tis -- si -- mis De -- o
  glo -- ri -- a,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    e16[^\tutti d c d] c4. h16 h
    c8. g16 g4 c8 h
    c8. g16 g4 c8 h
    c h16 h c8 e4 c8
    h8. h16 h4 r
  }
}

TenoreLyrics = \lyricmode {
  Glo -- _ ri -- a,
  glo -- ri -- a in al --
  tis -- si -- mis, in al --
  tis -- si -- mis De -- _ o
  glo -- ri -- a,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 c'16[^\tutti h] c8[ c, e g]
    c c16[ h] c8 c,[ e] g
    c8. h16 c8 c,[ e] g
    c g16 g e8[ c'] e,[ c]
    g'8. g,16 g4 r
  }
}

BassoLyrics = \lyricmode {
  Glo -- _
  _ ri -- a in __ al --
  tis -- si -- mis, in __ al --
  tis -- si -- mis De -- o __
  glo -- ri -- a,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8-\tutti c'16 h c8 c, e g
    c, c'16 h c8 c, e g
    c, c'16 h c8 c, e g
    c g e c' e, c
    g' g, g4 r
  }
}

BassFigures = \figuremode {
  r2.
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
