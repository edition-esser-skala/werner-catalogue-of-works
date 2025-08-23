\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    r2 r16 d'\f d( es) es c c( d)
    d b b( c) c a a( b) b8 g r4
    r16 f' f( g) g e e( f) f d d( es) es c c( d)
    d8 d, r4 r16 c' c( d) d8 d,
    r16 d' d( es) es4. as8 g8. g16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    r2 r8 r16 g'\f g( a) a f
    f( g) g es! es( fis) fis d d8 b r4
    r16 d' d( e) e cis cis( d) d h h( c) c a a( b)
    b8 b, r4 r r16 a' a( b)
    b8 b, r16 h' h( c) c8 f d8. d16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    d'8.^\tutti d16 d8 d d d r4
    r2 d4 c8 c
    d d r4 r2
    d8. d16 f8 d c c r d
    d4 r8 d c c4 h8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e --
  lei -- son,
  Ky -- ri -- e e -- lei -- son, Chri --
  ste, Chri -- ste au -- di
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    g'8.^\tutti g16 g8 fis g g r4
    r2 d8 g4 f8
    f f r4 r2
    f8. f16 a8 f f f r a
    g4 r8 g es[ as] g8. g16
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e --
  lei -- son,
  Ky -- ri -- e e -- lei -- son, Chri --
  ste, Chri -- ste au -- di
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    b8.^\tutti b16 b8 a b b r4
    r2 b8 b4 a8
    b b r4 r2
    b8. b16 c8 b a a r a
    b4 r8 h c[ f] d8. d16
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e --
  lei -- son,
  Ky -- ri -- e e -- lei -- son, Chri --
  ste, Chri -- ste au -- di
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    g'8.^\tutti g16 b,8 d g g r4
    r2 g4 es8 f!
    b, b r4 r2
    b'8. b16 a8 b f f r fis
    g4 r8 g as[ f] g8. g16
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e --
  lei -- son,
  Ky -- ri -- e e -- lei -- son, Chri --
  ste, Chri -- ste au -- di
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    g'8-\tutti g, b d g, g' c, f!
    b, es a, d g, g' es f!
    b, b' e, a d, g c, f
    b, b' a b f f, r fis'
    g g, r g' as f g g,
  }
}

BassFigures = \figuremode {
  r4. <_+> <7>4
  q q8 <_+>4. <6 5>4
  r <7>8 <_+>4 <_!>8 <_->4
  r1
  r4. <6- _!> <4>8 <_!>
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
