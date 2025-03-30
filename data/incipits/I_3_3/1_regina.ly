\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r r8 f'
    d4 f r
    R2.*4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r r8 a'
    b4 a r
    R2.*4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4^\solo b8[ c] d[ es]
    f4 b, \tuplet 3/2 4 { c8[ d es] }
    d4 c r8 a^\tutti
    b4 a c^\solo
    d c8[ b] a[ g]
    f[ e] f4 r8 c'
    d4 c8[ b] a[ g]
    f[ e] f[ g] a[ b]
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- re, re --
  gi -- na lae --
  ta -- re, lae --
  ta -- re re --
  gi -- na, "al -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r r8 f^\tutti
    f4 f r
    R2.*4
  }
}

AltoLyrics = \lyricmode {
  Lae --
  ta -- re,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r r8 c^\tutti
    d4 c r
    R2.*4
  }
}

TenoreLyrics = \lyricmode {
  Lae --
  ta -- re,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r r8 f^\tutti
    b4 f r
    R2.*4
  }
}

BassoLyrics = \lyricmode {
  Lae --
  ta -- re,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    b'4-\solo g f8 es
    d2 c4
    b f' r8 f,-\tutti
    b4 f f'-\solo
    b,2 c4
    d c8 b a4
    b2 c4
    d d' c8 b
  }
}

BassFigures = \figuremode {
  r2.
  <6>2 q4
  r2.
  r
  r2 <6>8 <5>
  r2 <6>4
  r2 <6>8 <5>
  r2.
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
