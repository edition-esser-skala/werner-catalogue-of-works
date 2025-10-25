\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c'8 g c e g4 h c h
    c8 g e g c,4 h' c h
    c8 g e g c,4 h c d
    e8 c g' h c4 g e c'
    h g2 d4 h g
    e' c g e c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e4 g8 c e4 d e d
    e8 c g c e4 d e d
    e8 c g c e,4 d e h'
    c d e c2 e4
    d g2 d4 h g
    e' c g e c2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    e'2.^\tutti d4 c d
    e4. e8 e4 d c d
    e2 e4 d c d
    e d c2 e
    d4 g2 d4 h g
    e'2 e r
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me -- _
  is, do -- _ nec _
  po -- nam
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    g'2.^\tutti g4 g g
    g4. g8 g4 g g g
    g2 g4 g g g
    g g g1
    g2 r r
    r g g
  }
}

AltoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me --
  is,
  do -- nec
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    c2.^\tutti h4 c h
    c4. c8 c4 h c h
    c2 c4 h c h
    c h c1
    h2 r r
    r g c
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me --
  is,
  do -- nec
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    c'2.^\tutti g4 e g
    c4. c8 c4 g e g
    c2 c4 g e g
    c g e2 c
    g' r r
    r4 c2 g4 e c
  }
}

BassoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me -- _
  is,
  do -- _ nec __ _
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c'2.-\tutti g4 e g
    c2. g4 e g
    c2. g4 e g
    c g e2 c
    g' r r
    r4 c2 g4 e c
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r
  r2. <\t>
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
