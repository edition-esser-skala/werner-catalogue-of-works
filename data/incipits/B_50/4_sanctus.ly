\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    c'1~
    c4 b a2\trill
    g8( d')\p e( f!) g a16( g) f8( e)
    f4 d2.\f
    c4 h h2\trill
    a8 e'\p f e16 d c8. d16 h4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    e4 a fis2~
    fis4 g2 fis4
    g8( h!)\p c( d) e16( d) cis8 d( \hA cis)
    r4 h,\f gis'2
    a2. gis4
    a8( c)\p a( h) a8. h16 gis4\trill
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    c'1~^\tutti
    c4 b a2
    g4 r r2
    d'1
    c4 h h2\trill
    a2 r
  }
}

SopranoLyrics = \lyricmode {
  San --
  ctus, san --
  ctus,
  san --
  _ ctus, san --
  ctus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    r2 fis~^\tutti
    fis4 g2 fis4
    g r r2
    r gis
    a4 a2 gis4
    a2 r
  }
}

AltoLyrics = \lyricmode {
  San --
  _ _
  ctus,
  san --
  ctus, san -- _
  ctus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    r4 a2.~^\tutti
    a4 g es' d
    d r r2
    r4 h!2.
    a4 f' e2
    e r
  }
}

TenoreLyrics = \lyricmode {
  San --
  ctus, san -- _
  ctus,
  san --
  _ ctus, san --
  ctus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    r2 r4 es^\tutti
    d es c d
    g, r r2
    r r4 e'!
    f d e2
    a, r
  }
}

BassoLyrics = \lyricmode {
  San --
  _ ctus, san -- _
  ctus,
  san --
  _ ctus, san --
  ctus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    c4-\tutti r r es
    d es c d
    g, r r2
    r r4 e'!
    f d e2
    a,4 d^\markup \remark "con Pedale" e2
  }
}

BassFigures = \figuremode {
  r2. <6 4 2\+>4
  <7 _+>2 <6 5>4 <_+>
  r1
  r2. <7 _+>4
  <5> <6 5> <4> <_+>
  r1
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
