\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    c'1 a4 f g a
    b c d c8 b a4 g a h
    c g c2. h8 a \hA h2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 f
    d4 a b c d e f e8 d
    e2. d8 c d1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    c'1 a4 f g a
    b c d c8[ b] a4 g a h
    c g c2. h8[ a] \hA h2
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 f
    d4 a b c d e f e8[ d]
    e2. d8[ c] d1
  }
}

AltoLyrics = \lyricmode {
  San --
  ctus, san -- _ _ _ _ _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1 a4 f g a
    b c d c8[ b] a4 g a2
    g c c1
    R\breve*2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san -- _ _
  _ _ _ _ _ _ ctus,
  san -- _ ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 f
    d4 a b c d e f2~
    f e f1
    R\breve
    r1 g
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san -- _ _ _ _ _
  _ ctus,

  "san -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      c'1-! a4 f g a
      b c d c8 b a4 g a2
      s\breve
      \clef soprano b'4 c d c8 b a4 g a h
      c g c2
    } \\ {
      s1 f,,1
      d4 a b c d e f2~
      f e f1
      d'4 a b c d e f e8 d
      e2. d8 c
    } >> \clef bass g1
  }
}

BassFigures = \figuremode {
  r\breve
  r
  <5 2>
  r
  r1 <4>2 <_!>
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
        \set Staff.instrumentName = "b"
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
