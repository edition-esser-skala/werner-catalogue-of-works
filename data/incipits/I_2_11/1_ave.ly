\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*5
    g'4\f b, g''~
    g f8 es d c
    b4 d b'~
    b a8 g f es
    d4 f d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4
    f4\f b, f''~
    f es8 d c b
    a4 c a'~
    a g8 f es d
    c4 es c'~
    c b8 a g f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*10
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f4^\solo b, b'~
    b a8[ g] f[ es]
    d4 b8 f' g4
    b8 f es2
    d r4
    R2.*5
  }
}

AltoLyrics = \lyricmode {
  A -- ve, a --
  ve Re --
  gi -- na, Re -- gi --
  na coe -- lo --
  rum,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*10
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*10
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    b4-\solo d b
    f f' a
    b d, es
    d c f
    b, d b
    es g es
    f a f
    g b g
    a c a
    b d b
  }
}

BassFigures = \figuremode {
  r2.
  <4>4 <3> <6>
  r q2
  q4 <7>2
  r2.
  <9>4 <6> q
  <9> <6> q
  <9> <6> q
  <9> <6> q
  <9> <6> q
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
