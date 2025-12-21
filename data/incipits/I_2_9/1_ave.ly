\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*7
    r4 c''-\tutti c,
    a'2 a4
    r g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*7
    r8 c'-\tutti e c e g
    f,4 c' c
    r e c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
    r4 c'^\tutti c
    c2 c4
  }
}

SopranoLyrics = \lyricmode {
  Sal -- ve
  ra -- dix,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4^\solo a g8[ f]
    e[ d] c4 d8[ e]
    f c b2
    a4 c a'
    g8[ f] e[ d] c[ h]
    c2~ c8[ a']
    g[ f] e4 d\trill
    c2 r4
    r a'^\tutti a
    g2 a4
  }
}

AltoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na, a --
  ve coe -- lo --
  rum, a -- ve
  Do -- mi -- na
  An --
  ge -- lo -- _
  rum:
  Sal -- ve
  ra -- dix,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
    r4 c^\tutti f
    e2 e4
  }
}

TenoreLyrics = \lyricmode {
  Sal -- ve
  ra -- dix,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
    r4 f^\tutti f,
    c'2 c4
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve
  ra -- dix,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    f4-\solo f, b
    c a' b
    a g c,
    f8 g a4 f
    c' c, d
    e8 c' h a g f
    e f g4 g,
    c2 r4
    r f-\tutti f,
    c'2 c4
  }
}

BassFigures = \figuremode {
  r2 <6>8 <5>
  r4 <6>2
  q4 <7> q
  r2.
  r2 <6!>4
  <6>2.
  q4 <6 4> <5 _!>
  r2.
  r
  <5>2 <6>4
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
