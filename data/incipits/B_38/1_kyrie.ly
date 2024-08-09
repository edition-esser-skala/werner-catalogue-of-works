\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d'16\f d, fis a d fis e a fis fis, a d fis a e a
    d a8 e16 fis a8 d16 cis a e cis a8 r
    r16 cis'\p ais fis d32( e64 fis gis ais h cis d16) d, cis4 r16 fis dis h
    g h fis h g32( a64 h cis dis e fis g16) g, fis4 r16 e\f gis h
    cis32 a h cis d e fis g a8. a16 fis8 d h g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d'16\f d, fis a d fis e a fis fis, a d fis a e a
    d a8 e16 fis a8 d16 cis a e cis a8 r
    r16 cis'\p ais fis d32( e64 fis gis ais h cis d16) d, cis4 r16 fis dis h
    g h fis h g32( a64 h cis dis e fis g16) g, fis4 r16 e\f gis h
    cis32 a h cis d e fis g a8. a16 fis8 d h g'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'8.^\tutti d16 d8 e fis8.[\trill a32( g)] fis8 e
    d[ e] fis4\trill e r8 e
    fis2\trill fis8 fis, h4~
    h2\trill h8 h e4~
    e8[ cis a] d4 h8[ g cis]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- lei --
  son, e -- lei --
  _ "-"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    fis8.^\tutti fis16 fis8 a a4 a8 a
    a2 a4 r
    r8 cis fis,[ h] ais4 r8 fis
    g[ fis] g16[ fis g8] fis4 r
    r8 e a4 fis8[ d] g4
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son,
  e -- lei -- son, e --
  lei -- _ son,
  e -- lei -- _ "-"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a8. a16 a8 a a[ fis'16 e] d8 cis
    fis( e4 d8) cis4 r
    r8 cis d16[ cis d8] cis4 r8 h
    h[ fis'] e16[ dis e8] dis4 r8 h
    cis4. a8 d4 h8[ g]
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son,
  e -- lei -- son, e --
  lei -- _ son, e --
  lei -- _ _ "-"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d8.^\tutti d16 d8 cis d4 d8 a'
    fis[ cis] d4 a r
    r8 ais' h[ h,] fis'4 r8 dis
    e[ dis] e4 h r8 gis'
    a!4. fis8 d g4 e8
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son,
  e -- lei -- son, e --
  lei -- _ son, e --
  lei -- _ _ _ "-"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d4. cis8 d4. a'8
    fis cis d4 a r
    r8 ais'\p h h, fis'4 r8 dis
    e dis e e, h'4 r8 gis'
    a!4. fis8 d g4 e8
  }
}

BassFigures = \figuremode {
  r1
  r4 <9>8 <8> r2
  r1
  r2.. <6>8
  r1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
