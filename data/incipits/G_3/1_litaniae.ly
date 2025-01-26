\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante passato"
    g'16.\f g32 b16. g32 d'16. d32 f16. d32 g8 g, r16 b' g16. d32
    es8 c' r16 a f16. c32 d8 b' r16 g es16. b32
    c8 a' r16 fis d16. a32 b8 d b'( a)
    g( f) es!( d) cis2
    d\fermata r
    g,16. g32 b16. g32 d'16. d32 f!16. d32 g8 g, r16 d' h16. g32
    es'8 c, r16 g'' es16. c32 a8 a' r16 b! f16. d32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante passato"
    g'16. g32 b16. g32 d'16. d32 f16. d32 g16. g,32 b16. d32 g8 b
    r16 es, c16. g32 a8 a' r16 d, b16. f32 g8 g'
    r16 c, a16. e32 fis8 a d, b'16. a32 g8 d'
    g( f!) es!( d) cis( b!) a( g)
    fis2\fermata r
    g16. g32 b16. g32 d'16. d32 f!16. d32 g16. g,32 c16. es32 g8 g,
    r16 c g16. es32 c8 c' r16 c a16. f32 d8 b'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \tempoMarkup "Andante passato" \autoBeamOff
    R1*4
    r2\fermata d'4. d8
    d4 r r d
    es2. d8 d
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Andante passato" \autoBeamOff
    R1*4
    r2\fermata g'4. g8
    g4 r r g
    g2 f4 f
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \tempoMarkup "Andante passato" \autoBeamOff
    R1*4
    r2\fermata b4. b8
    b4 r r d
    c2 c8 c b b
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante passato" \autoBeamOff
    R1*4
    r2\fermata g'4. g8
    g4 r r h,
    c es8 es f4 b!
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante passato"
    g'4-\solo f es b
    c f b, es
    a, d g4. f8
    es4 r e2
    d\fermata g4.-\tutti g8
    g4 f! es h
    c es f b!
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r1
  <7>4 <_+>2.
  <7>2 <6\\>
  <_+>1
  <_->4 <6 4> <6>2
  r4 <6> <7>2
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
