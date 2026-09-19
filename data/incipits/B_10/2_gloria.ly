\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis16 a d a fis' d a' fis h8 e,
    \kneeBeam fis16 a,, d a fis' d a' fis h8 e,
    fis16 d a' fis d' h d fis h8 a
    gis16 h gis e h e h gis e gis h e
    a, cis e a \sbOn h, a' a16.\trill gis64( a) e,16 gis' gis16.\trill fis64( gis) \sbOff
    a16 e fis d e cis d h cis a h gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis16 a d a fis' d a' fis h8 e,
    \kneeBeam fis16 a,, d a fis' d a' fis h8 e,
    fis16 d a' fis d' h d fis h8 a
    gis16 h gis e h e h gis e gis h e
    a, cis e a \sbOn h, a' a16.\trill gis64( a) e,16 gis' gis16.\trill fis64( gis) \sbOff
    a16 cis, d h cis e, fis d e cis d h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4^\tutti r8 d d cis
    d4 r8 d d cis
    d4 d4. cis8
    h8. h16 h8 h4 h8
    a cis h2
    cis4 r r
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis4^\tutti r8 a e e
    fis4 r8 a e e
    fis4 fis e
    e8. e16 e8 e4 gis8
    e e e2
    e4 r r
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    a4^\tutti r8 a h a
    a4 r8 a h a
    a4 r8 h4 a8
    gis8. gis16 gis4 h8 e
    e cis16[ a] a4 gis
    a r r
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4^\tutti r8 fis g a
    d,4 r8 fis g a
    d,4 h' gis8 a
    e8. e16 e4 gis8 e
    cis a' e2
    a,4 r r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\tutti r8 fis g a
    d,4 r8 fis g a
    d,4 h gis8 a
    e4 e' gis8 e
    cis a e2
    a4 r r8 e'-\solo
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2 <6 5>4
  r <5> <6 5>
  <_+>2.
  r4 <4> <_+>
  r2 r8 <_+>
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
