\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    d'2. a'4 g8 d h g'
    fis4 g4. d'8 c4 a2\trill
    h4 r r2 r
    r4 g2 fis4 g e
    fis g2 fis4 g2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    h'2. d4~ d8 h g h
    a4 g d' e d2\trill
    d4 h2 a4 h e
    a, h8 c! d2 h4 c
    a h a2\trill h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    h'4.^\tutti d16[ c] h4 a h4. h8
    a4 g d' e d2
    d4 h2 a4 h e
    a, h8[ c!] d2 h4 e
    d d d2 d4 d^\solo
  }
}

SopranoLyrics = \lyricmode {
  Di -- _ _ xit Do -- mi --
  nus Do -- mi -- no me --
  o: Se -- de, se -- _
  de a dex -- tris, a
  dex -- tris me -- is, "do -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    g'2.^\tutti d4 d g
    fis g4. g8 g4 g fis
    g2 r r
    r4 g2 fis4 g e
    fis g2 fis4 g2
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi --
  nus Do -- mi -- no me -- _
  o:
  Se -- de a dex --
  tris me -- _ is,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    d2^\tutti d d4. d8
    d4 h g c a2
    h r4 d2 cis4
    d( h) a2 r4 c
    a h a2 h
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi --
  nus Do -- mi -- no me --
  o: Se -- de,
  se -- de a
  dex -- tris me -- is,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    g'4.^\tutti h16[ a] g4 fis g4. g8
    d4 e h c d2
    g,4 g'2 fis4 g e
    fis g d2 e4 c
    d g d2 g,
  }
}

BassoLyrics = \lyricmode {
  Di -- _ _ xit Do -- mi --
  nus Do -- mi -- no me --
  o: Se -- de, se -- _
  de a dex -- tris, a
  dex -- tris me -- is,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g'4.-\tutti h16 a g4 fis g2
    d4 e h c d2
    g,4 g'2 fis4 g e
    fis g d2 e4 c
    d g d2 g,
  }
}

BassFigures = \figuremode {
  r1.
  r4 <5> r2 <4>4 <3>
  r2. r2 <6\\>4
  r2 <4>4 <3> <5>2
  r <4>4 <3>2.
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
