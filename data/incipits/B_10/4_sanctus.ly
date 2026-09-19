\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 a'4 g16 fis h8 a
    d a4 g16 fis h8 a
    d a4 g fis8
    e4 r a'~
    a8 fis d4 h'~
    h8 g e4 cis'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 fis4 e16 d g8 fis16 e
    fis4. e16 d g8 fis16 e
    fis4 e4. d8~
    d cis16 h cis8 cis'4 a8
    fis d r d'4 h8
    g e r e'4 cis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 a'4^\tutti g16[ fis] h8[ a]
    d a4 g16[ fis] h8[ a]
    d a4 g fis8
    e4 r8 cis'4 a8
    fis d r d'4 h8
    g e r e'4 cis8
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _
  _ _ _ _
  ctus, san -- ctus,
  san -- ctus, san -- ctus,
  san -- ctus, san -- ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 fis4^\tutti e16[ d] g8[ fis16 e]
    fis4. e16[ d] g8[ fis16 e]
    fis4 e4. d8~
    d[ cis16 h] cis4 a'~
    a8[ fis] d4 h'~
    h8 g e4 cis'
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  _ _ _
  ctus, san --
  ctus Do --
  mi -- nus, "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 d^\tutti d,
    r d' d,
    a'2.
    a4 r r
    d4. h8 g4
    e'4. cis8 a4
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san --
  ctus
  Do -- mi -- nus,
  Do -- mi -- nus,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4^\tutti d r
    d d r
    d cis d
    a a'4. fis8
    d4 h'4. g8
    e4 cis'4. a8
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _ _
  ctus Do -- mi --
  nus, Do -- mi --
  nus, Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\tutti d, r
    d' d, r
    d' cis d
    a a'4. fis8
    d4 h'4. g8
    e4 cis'4. a8
  }
}

BassFigures = \figuremode {
  r2.
  r
  r4 <3 6>8 <_ 5> <9 4> <8 _+>
  <4>4 <_+>2
  r4 <5> <6>
  r2 q4
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
