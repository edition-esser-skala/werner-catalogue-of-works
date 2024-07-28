\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'4 c8 h \grace h a8. a16 g4
    f'4. e8 e8. d16 d4
    d4. c8 c h h a
    g g'4 fis8 \grace fis16 e8 d16 e d4
    d8 d d c \grace c h8. c16 d8 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    g'4 g8 g \grace g f8. f16 e4
    g4. a8 g8. g16 g4
    h4. a8 g4 fis8 fis
    g4 g g g
    a8 a a a \grace a g8. a16 h8 g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    c'4 c8 h \grace h a8. a16 g4
    f'4. e8 e8. d16 d4
    d4. c8 c[ h] h a
    g g'4 fis8 \grace fis16 e8[ d16 e] d4
    d8 d d c \grace c h8. c16 d8 e
  }
}

SopranoLyrics = \lyricmode {
  Da pa -- cem, Do -- mi -- ne,
  pa -- cem, Do -- mi -- ne,
  in di -- e -- bus, di --
  e -- _ bus no -- stris,
  qui -- a non est a -- li -- us qui
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    g'4^\tutti g8 g \grace g f8. f16 e4
    g4. a8 g8. g16 g4
    h4. a8 g4 fis8 fis
    g4 g g g
    a8 a a a \grace a g8. a16 h8 g
  }
}

AltoLyrics = \lyricmode {
  Da pa -- cem, Do -- mi -- ne,
  pa -- cem, Do -- mi -- ne,
  in di -- e -- bus, di --
  e -- bus no -- stris,
  qui -- a non est a -- li -- us qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    e4 e8 e c8. c16 c4
    d4. c8 c8. h16 h4
    r2 d4. c8
    h4 d \grace d16 c8[ h16 c] h4
    d8 d d d d8. d16 h8 c
  }
}

TenoreLyrics = \lyricmode {
  Da pa -- cem, Do -- mi -- ne,
  pa -- cem, Do -- mi -- ne,
  in di --
  e -- bus no -- stris,
  qui -- a non est a -- li -- us qui
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    c4 c8 c c8. c16 c4
    h c8 fis g8. g,16 g4
    g'4. g8 g4 d8 d
    e4 h c g'
    fis8 fis fis fis g8. g16 g8 g
  }
}

BassoLyrics = \lyricmode {
  Da pa -- cem, Do -- mi -- ne,
  pa -- _ cem, Do -- mi -- ne,
  in di -- e -- bus, di --
  e -- bus no -- stris,
  qui -- a non est a -- li -- us qui
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c8 c c c c c c c
    h h' c fis, g g g, g
    g' g g g g g d d
    e e h h c4 g
    fis'8 fis fis fis g4 g,
  }
}

BassFigures = \figuremode {
  r2 r8 <6 4> <5>4
  <6 5> <9>8 <7 5> <6 4>4 <5 3>
  r2. <8 6>8 <7 5>
  <5>4 <6>8 <5\+> <5>2
  <6>1
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
