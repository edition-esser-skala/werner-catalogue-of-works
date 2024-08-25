\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r16 fis' a g fis8 e r2
    r16 fis,\p a g fis8 e\f fis a d\trill fis\trill
    e16( fis) e( fis) e(\p fis) e( cis') e,( fis) e( fis) e( fis) e( h')
    d,( e) d( e) d( e) d( a') cis,( d) cis( d) cis( d) cis( gis')
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r16 d' fis e d8 cis r2
    r16 d,\p fis e d8 cis\f d fis a d
    cis16( d) cis( d) cis(\p d) cis( a) h8 gis4 gis8
    a fis4 a8 gis e'4 e,8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'8.^\tutti d16 d8 cis d[ fis16 e] d8[ cis]
    d4 r8 cis\p d[ fis16 e16] d8[ cis]
    d4 r8 e\f fis8.[ e16] d4
    cis r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei -- _
  son, e -- lei -- _
  son,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    fis8.^\tutti fis16 fis8 e fis[ a16 g] fis8[ e]
    fis4 r8 e\p fis[ a16 g] fis8[ e]
    fis4 r8 a\f a2
    a4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei -- _
  son, e -- lei --
  son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d8.^\tutti a16 a8 a a2
    a4 r8 a\p a2
    a4 r8 cis\f d8.[ e16] fis4
    e r r2
    R1
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei -- _
  son,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'8.^\tutti d16 d8 a fis[ d fis a]
    d4 r8 a\p fis[ d fis a]
    d4 r8 a\f d[ a fis d]
    a4 r8 a'^\solo gis8[ h e e,]
    fis4 r8 fis e[ gis cis cis,]
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- "lei -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d'4.-\tutti a8 fis d fis a
    d4 r8 a\p fis d fis a
    d4 r8 a d a fis d
    a4 r r2
    R1
  }
}

BassFigures = \figuremode {
  r2.. <3>8
  r1
  r2. <6>4
  r1
  r
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
