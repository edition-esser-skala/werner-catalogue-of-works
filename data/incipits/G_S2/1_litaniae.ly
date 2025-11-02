\version "2.24.2"
\include "header.ly"

ClarinettoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    e'2\f e4 e
    e r r2
    r4 e d2
    e4 r r2
    d\p e
    f8( e f g) e2
    d e
    f8( e f g) e4 g
  }
}

ClarinettoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    c'2\f c4 c
    c r r2
    r4 c2 h4
    c r r2
    h\p c
    d8( c d e) c2
    h c
    d8( c d e) c4 g
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    c'4\f c8 c c4 c
    c r r2
    r4 c d d
    c r r2
    R1*3
    r2 r4 \pao g
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    e4\f e8 e e4 e
    e r r2
    r4 e g g
    e r r2
    R1*3
    r2 r4 g
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    c4\f c8 c c4 c
    c r r2
    r4 c g g
    c r r2
    R1*3
    r2 r4 g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    <g' e' c'>4\f r r2
    r4 e8.\trill d32 e f8 r fis8.\trill e32 \hA fis
    g4 <e' c'> <d c'> <d h'>
    c' g g g
    h,8(\p c d h) c4 g'
    d8( e f d) e4 c'
    h8( c d h) c4 g
    f8( e f g) e4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    <g' c e>4\f r r2
    r4 e8.\trill d32 e f8 r fis8.\trill e32 \hA fis
    g4 e' d2
    <e g,>4 r r2
    f,8(\fp g f g) e( g e g)
    h,( g' h, g') c,( g' c, g')
    f( g f g) e( g e g)
    h,( g' h, g') c,4 r
    
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    c'2^\tutti c
    c4 r r2
    r4 e d2
    e4 r r2
    h4. h8 c4 e
    d( f) e c
    h2 c
    d4( f) e r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- 
  son,
  Ky -- ri -- e e -- 
  lei -- son, Chri --
  ste e -- 
  lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    e2^\tutti e
    e4 r r2
    r4 g a( g)
    g r r2
    g4. g8 g4 g
    g2 g4 g
    g2. g4
    g2 g4 r
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- 
  son,
  Ky -- ri -- e e -- 
  lei -- son, Chri --
  ste e -- 
  lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    g2^\tutti g
    g4 r r2
    r4 c2 h4
    c r r2
    d4. d8 e4 c
    h( d) c e
    d2 e
    h4( d) c r
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- 
  son,
  Ky -- ri -- e e -- 
  lei -- son, Chri --
  ste e -- 
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
    c4(^\tutti c' g) e
    c r r2
    r4 c f( g)
    c, r r2
    f4. f8 e4 c
    h( g) c( e)
    f2 e4 c
    h( g) c r
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- 
  son,
  Ky -- ri -- e e -- 
  lei -- son, Chri --
  ste e -- 
  lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Adagio"
    c4 c' g e
    c e8.-! d32-! e-! f8-! r fis8.-! e32-! \hA fis-!
    g4-! a f g
    c, r r2
    d4\p g, e' g,
    h g c g
    d' g, e' g,
    h g c r
  }
}

BassFigures = \figuremode {
  <8 3>2. \once \bassFigureExtendersOn q4
  r1
  r4 <5> <6 5> <3>
  r1
  <6>4 <\t> <6> <\t>
  <6 5> <\t \t> <8> <\t>
  <6>4 <\t> <6> <\t>
  <6 5> <\t \t> <3>2
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "cl" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinettoI \ClarinettoII
      }
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
