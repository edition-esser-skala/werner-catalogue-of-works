\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 2/1 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*6
    d'1 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 2/1 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    a'1 b
    a2 g a2. g4
    f d8 e f4 g a8 b a4 g f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/1 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*6
    d'1 f
  }
}

SopranoLyrics = \lyricmode {
  San -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 2/1 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    a'1 b
    a2 g a2. g4
    f d8[ e] f4 g a8[ b] a4 g f
  }
}

AltoLyrics = \lyricmode {
  San -- _
  ctus, __ _ san -- _
  _ _ _ _ _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 2/1 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    d1 f
    e2 d e2. d4
    cis8[ d] e4 d cis d2 d
    c8[ h] c2 d4 e d8[ c] d4 e
    a,2 a4 b c2. d4
  }
}

TenoreLyrics = \lyricmode {
  San -- _ %3
  ctus, __ _ san -- _
  _ _ _ _ ctus, san --
  _ _ _ _ _ _ _
  ctus, san -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 2/1 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 b
    a2 g a2. g4
    f g f e d e f g
    a c h a gis e fis? gis
    a g f e d g d e
    f f e d cis a h cis
    d2 r a'4 g8[ f] e4 d
  }
}

BassoLyrics = \lyricmode {
  San -- _
  ctus, __ _ san -- _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ ctus, _ san -- _ _ _
  ctus, san -- _ _ _ _ _ _
  ctus, san -- _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 2/1 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1-! b-!
    a2-! g-! a2.-! g4-!
    << {
      d'1 f
      e2 d e2. d4
    } \\ {
      f,4 g f e d e f g
      a c h a gis e fis? gis
    } >>
    a g f e d g d e
    f f e d cis a h cis
    d d' c! b! a g8 f e4 d
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r
  <_+>2 <6>4 <6\\> <8 6->2. \once \bassFigureExtendersOn q4
  r\breve
  r2 <\t> <6>1
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
