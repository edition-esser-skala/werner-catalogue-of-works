\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis'16 a d a fis8 e d e
    fis16 d a' g fis a e a fis8.\trill fis16
    e8 e a g fis g16 a
    d, g fis e d8 h' e, a
    fis16 d a' fis d'4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'8 fis16. e32 d8 cis d cis
    d fis16 e d8 e d16 d, a' d
    cis4 r16 a h cis d8 e
    d16 g fis e d8 h' e, a
    fis16 a fis d fis4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4^\tutti r8 cis d cis
    d4 r8 e d8. d16
    cis8 cis[ d] e fis e
    d16[ g fis e] d4. cis8
    d4 r8 a^\solo h16[ g] fis[ e]
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- _ _
  tis. Lau -- da -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis4^\tutti r8 e fis e
    fis4 r8 e fis8. fis16
    e8 e a4 a
    h a8[ h] a4
    a r8 fis^\solo e d16[ cis]
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- _ nae
  vo -- lun -- ta --
  tis. Lau -- da -- mus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    a4^\tutti r8 a a a
    a4 r8 a a8. a16
    a4 r a8 h16[ cis]
    d4. g8 e4
    fis r r
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4^\tutti r8 a' fis a
    d,4 r8 cis d8. d16
    a4 r d'8 cis
    h[ a16 g] fis8[ g] a4
    d, r r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\tutti r8 a' fis a
    d,4 r8 cis d d,
    a' a'16 g fis8 e d cis
    h a16 g fis8 g a4
    d r8 d'-\solo g, a
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2.
  r
  r4 <6> <4>8 <_+>
  r2 <6>4
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
