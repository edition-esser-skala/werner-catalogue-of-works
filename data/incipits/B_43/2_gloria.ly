\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    f16\p d a' f d' a f' d a'8 e
    r f4 e16 d c!8 b
    a16 b c a f8 a\f c g
    a16 b c a f8 a\p c g
    a c4 f a8
    r d,4 fis a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    r16 a'\p f d a' f d d' d8 cis
    r d4 c16 b a8 g
    f16 g a f a8 f4\f e8
    f16 g a f a8 f4\p e8
    f a4 c f8
    r a,4 d fis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r8 f'^\tutti a, c f, r
    r f'\p a, c f, r
    r4 a2
    r4 a2
  }
}

SopranoLyrics = \lyricmode {
  In ter -- ra pax,
  in ter -- ra pax,
  pax,
  pax,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r8 f^\tutti f e
    f4 r8 f\p f e
    f4 f2
    r4 fis2
  }
}

AltoLyrics = \lyricmode {
  In ter -- ra
  pax, in ter -- ra
  pax, pax,
  pax,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r8 a^\tutti c g
    a4 r8 a\p c g
    a4 a2
    r4 d2
  }
}

TenoreLyrics = \lyricmode {
  In ter -- ra
  pax, in ter -- ra
  pax, pax,
  pax,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4^\solo r8 d' f, a
    d,4 r r8 e
    f4 r8 f^\tutti a c
    f,4 r8 f\p a c
    f,4 f2
    r4 d2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax,
  pax, in ter -- ra
  pax, in ter -- ra
  pax, pax,
  pax,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\solo r8 d' f, a
    d,4 r r8 e
    f4 r8 f-\tutti a, c
    f,4 r8 f'\p a, c
    f, f' f f f f
    d d d d d d
  }
}

BassFigures = \figuremode {
  r2 r8 <_+>
  r2 r8 <6>
  r2.
  r
  r
  <_+>
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
