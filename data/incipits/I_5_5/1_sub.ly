\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    e4 f g a g a g f
    e d c2. d8 e f4 e
    d c h c8 d e4 f g f
    e e' d c h a g f
    e g c8 d e4 d8 e fis4 g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    c4 d e f e f e d
    c h c d8 e f4 e d c
    h a g a8 h c4 d e d
    c c' h a g f e d
    c d e8 fis g4 a d2 c4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1^\tutti c
    c a2 f
    g2. g4 c,2 r
    r g' h g
    c e d1
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- _
  si -- di -- um
  con -- fu -- gi --
  mus, San -- cta
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1 c
    c a2 f
    g2. g4 c,2 c
    e c g'1
    g4 a8[ h] c4 h a fis g a
  }
}

AltoLyrics = \lyricmode {
  Sub tu --
  um prae -- _
  si -- di -- um con --
  fu -- gi -- mus,
  no -- _ _ stras De -- _ i _
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1^\tutti c
    c a2 f
    g2. g4 c,1
    r r4 h' c d
    e2 r r4 d2 c4
  }
}

TenoreLyrics = \lyricmode {
  Sub tu --
  um prae -- _
  si -- di -- um
  con -- fu -- gi --
  mus, San -- cta
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1^\tutti c
    c a2 f
    g2. g4 c,1
    r4 c' h a g f e d
    c2 r fis4 d e fis
  }
}

BassoLyrics = \lyricmode {
  Sub tu --
  um prae -- _
  si -- di -- um
  con -- _ _ fu -- _ gi -- _
  mus, San -- _ cta _
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    c4-\tutti d e f e f e d
    << { c' } \\ { c, } >> h' a g f e d c
    h a g h c d e d
    c c' h a g f e d
    << { c' } \\ { c, } >> h' a g fis d e fis
  }
}

BassFigures = \figuremode {
  r\breve
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
