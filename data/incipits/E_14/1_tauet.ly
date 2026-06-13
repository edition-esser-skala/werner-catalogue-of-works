\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 a'16\fE a a8 c f c
    a c16 c c8 f a f
    c f16 f f8 a c a
    f16(\p a) c,( d) c( d) c( d) c( d) c( d)
    r g c,( d) c( d) c( d) c( d) c( d)
    r c' c,( d) c( d) c( d) c( d) c( d)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 f16\fE f f8 a c a
    f a16 a a8 c f c
    a c16 c c8 f16 a f8 c
    a16(\p f') a,( b) a( b) a( b) a( b) a( b)
    r c e, f g8 c, a' f
    r e f a~ a16( b) a( b)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 a c
    a f c'
    f c a
    f r r
    c'^\aTre c a
    g c, c'
  }
}

SopranoLyrics = \lyricmode {
  Tau -- et ihr
  Him -- mel und
  trief -- fet he --
  rab
  je -- ne ſo
  herr -- lich "ver -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 a c
    a f c
    f c a
    f r r
    g'^\aTre g f
    e f a
  }
}

AltoLyrics = \lyricmode {
  Tau -- et ihr
  Him -- mel und
  trief -- fet he --
  rab
  je -- ne ſo
  herr -- lich "ver -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f,4 a c
    a f c'
    f c a
    f r r
    e'^\aTre e f
    c a f
  }
}

TenoreLyrics = \lyricmode {
  Tau -- et ihr
  Him -- mel und
  trief -- fet he --
  rab
  je -- ne ſo
  herr -- lich "ver -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 a c
    a f c
    f c a
    f r r
    R2.*2
  }
}

BassoLyrics = \lyricmode {
  Tau -- et ihr
  Him -- mel und
  trief -- fet he --
  rab
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 r r
    f r r
    << { f' c a f } \\ { f c a f } >>
    r r
    \clef tenor e''2^\aTre f4
    c a f
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <6>
  r4 q2
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
