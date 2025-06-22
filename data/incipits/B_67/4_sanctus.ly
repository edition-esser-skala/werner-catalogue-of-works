\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    f'2. e4 f2
    e d1
    c2 a'4 g a2
    e f1
    e4 c e d e f
    g f d e f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 a'2. b4
    c2 f,2. g4
    a b c1~
    c2 c h
    c g4 f g a
    b! a b c d e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 a'2. b4
    c2 f,2. g4
    a b c1
    c2 c h
    c g4 f g a
    b! a b c d e
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  ctus, san -- _
  _ _ _
  ctus, san -- _
  ctus Do -- _ _ _
  _ _ _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    f2. e4 f2
    e2 d1
    c2 a'4 g a2
    e f1
    e4 c e d e f
    g f d e f g
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  ctus, san -- _ _
  ctus, san --
  ctus, san -- _ _ ctus _
  Do -- _ _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    d2. c4 d2
    a b1
    a r2
    c a d
    g, c b!4 a
    g1 f4 e
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  ctus,
  san -- _ _
  ctus, san -- ctus _
  Do -- "mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*2
    f2. e4 f2
    c d1
    c r2
    R1.
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  ctus
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    d'2.-\tutti c4 d2
    a b1
    \clef bass f2. e4 f2
    c d1
    c2 \clef tenor c' b!4 a
    g1 f4 e
  }
}

BassFigures = \figuremode {
  r1.
  r2 <5>2. <6>4
  r1.
  r2 <7> <6!>
  r1.
  <5>1 <6>2
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
