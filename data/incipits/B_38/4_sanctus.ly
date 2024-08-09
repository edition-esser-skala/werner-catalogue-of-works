\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Larghetto"
    R1
    r16 fis'\p a,( h) g e' g,( a) fis32( g16.) g32( a16.) a32( h16.) h32( cis16.)
    cis4 r r2
    r16 cis'\p e,( fis) d h' d,( e) cis32( d16.) d32( e16.) e32( fis16.) fis32( g!16.)
    g32( a16.) a32( h16.) h32( cis16.) cis32( d16.) d4 r
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Larghetto"
    R1
    r16 d'\p fis,( g) e( g) e( fis) d32( e16.) e32( fis16.) fis32( g16.) g32( a16.)
    a4 r r2
    r16 a'\p cis,( d) h( d) h( cis) a32( h16.) h32( cis16.) cis32( d16.) d32( e16.)
    e32( fis16.) fis32( g16.) g32( e16.) e32( fis16.) fis4 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    a'4^\tutti d h8[ a] h4
    a r r2
    r a4 d
    cis r r2
    r a8 d4 h8~
    h g'4 e e8 d8. d16
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- _
  ctus,
  san -- _
  ctus,
  san -- _ ctus __
  Do -- mi -- nus Sa -- "ba -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r2 d4^\tutti g
    fis r r2
    e4 a fis8[ e] fis4
    e r r2
    r fis4 g
    h g8 g g g fis8. fis16
  }
}

AltoLyrics = \lyricmode {
  San -- _
  ctus,
  san -- ctus, san -- _
  ctus,
  san -- ctus
  Do -- mi -- nus De -- us Sa -- "ba -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r2 r8 fis,[^\tutti d d']
    d4 r r2
    r r8 cis a16[ g a8]
    a4 r r2
    r d4. d8
    d4 e8 h a4. a8
  }
}

TenoreLyrics = \lyricmode {
  San --
  ctus,
  san -- _
  ctus,
  san -- ctus
  Do -- mi -- nus Sa -- "ba -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r8 d[^\tutti fis d] g[ d h g]
    d'4 r r2
    r8 a'[ cis] a d[ a fis d]
    a'4 r r2
    r d4 h
    g e8 e cis cis d d
  }
}

BassoLyrics = \lyricmode {
  San -- _
  ctus,
  san -- ctus, san --
  ctus,
  san -- ctus
  Do -- mi -- nus De -- us Sa -- "ba -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Larghetto"
    d,8-\tutti d' fis d g d h g
    d'4.-\tasto cis8 d r r4
    a8 a' cis a d a fis d
    a'4.-\tasto gis8 a r r4
    r2 d4 h
    g! e cis d
  }
}

BassFigures = \figuremode {
  r2 r8 <3> <6>4
  r1
  r2 r8 <3>4.
  r1
  r
  r2 <6 5>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
