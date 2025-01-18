\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    h'16([ d8.) d16( g8.) g16( h8.)]
    h16([ g8.) g16( d8.) e16( g8.)]
    d16([ c8.) h16( g8.) a16( fis8.)]
    \pa g8 h16( d) g8 d16( g) \pd h4
    r8 a4 \pa fis16( d) h'( g8.) \pd
    a16([ fis8.) d16( a8.) h16( g8.)]
    a8 fis'16( d) a8 d16( a) fis8 d'
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    g'16([ h8.) h16( d8.) d16( g8.)]
    g16([ d8.) d16( h8.) c16( e8.)]
    h16([ a8.) g16( h8.) a16( fis8.)]
    g8 d16( g) h( g) h( d) g4
    r8 d4 fis8 d16( g8.)
    fis16([ d8.) a16( fis8.) g16( h8.)]
    fis8 d'16( a) fis8 a16( fis) d8 fis
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    h'16([ d8.) d16( g8.) g16( h8.)]
    h16([ g8.) g16( d8.) e16( g8.)]
    d16([ c8.) h16( g8.) a16( fis8.)]
    g8 h16( d) g8 d16( g) h4
    r8 a4 fis16( d) h'( g8.)
    a16([ fis8.) d16( a8.) h16( g8.)]
    a8 fis'16( d) a8 d16( a) fis8 d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante"
    g'16([ h8.) h16( d8.) d16( g8.)]
    g16([ d8.) d16( h8.) c16( e8.)]
    h16([ a8.) g16( h8.) a16( fis8.)]
    g8 d16( g) h( g) h( d) g4
    r8 d4 fis8 d16( g8.)
    fis16([ d8.) a16( fis8.) g16( h8.)]
    fis8 d'16( a) fis8 a16( fis) d8 fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 r d'
    d g e
    d h a
    h r d
    d a g
    fis8[ g] a4 h
    a r a
  }
}

SopranoLyrics = \lyricmode {
  Ô
  längſt __ _ er --
  wünsch -- _ te
  Nacht voll
  Liecht __ _ und
  kla -- _ ren
  Schein, mein
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 r g'^\tutti
    g2 g4
    g2 fis4
    g r g
    a fis d
    d2 d4
    d r fis
  }
}

AltoLyrics = \lyricmode {
  Ô
  längſt er --
  wünsch -- te
  Nacht voll
  Liecht __ _ und
  kla -- ren
  Schein, mein
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 r h^\tutti
    h8[ a] h4 c
    h8[ c] d4 d
    d r h
    a2 h4
    a8[ g] fis4 g
    fis r d'
  }
}

TenoreLyrics = \lyricmode {
  Ô
  längſt __ _ er --
  wünsch -- _ te
  Nacht voll
  Liecht und
  kla -- _ ren
  Schein, mein
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 r g'^\tutti
    g2 c,4
    g'2 d4
    g, r g'
    fis2 g4
    d d' g,
    d r d
  }
}

BassoLyrics = \lyricmode {
  Ô
  längſt er --
  wünsch -- te
  Nacht voll
  Liecht und
  kla -- _ ren
  Schein, mein
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Andante"
    g8. g'16 d4 h
    g2.
    g2 d'4
    g2 g4
    fis2 g4
    d d' g,
    d2 d4
  }
}

BassFigures = \figuremode {
  r4 <\t>2
  r <6 4>4
  <5 3>2.
  r
  r
  r
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "ob" "1, 2" }
        \partCombine #'(0 . 10) \OboeI \OboeII
      >>
    >>
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
