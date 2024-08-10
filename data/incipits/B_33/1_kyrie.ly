\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegro"
    R2.
    a'8\f fis'~ fis16 d a d fis, a d a
    h4 r8 d4 g8~
    g16 e cis e a,8 e'4 a8~
    a16 fis d fis a,8 a4 d8
    h16 g h d g h g d h d h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegro"
    R2.
    fis8\f d'~ d16 a fis a d, fis8 a16
    d,4 r8 h'4 d8
    e8. e16 cis a e a cis,8 e'
    fis16 d a d fis,8 d fis a
    h16 g h d g h g d h d h g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 h'4 d g8
    fis4 r8 d4 d8
    h h d4~ d8.[\trill c32 d]
    e8 cis e4~ e8.[\trill d32 e]
    fis4 r8 a,4 d8
    h2 h4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- _ ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, Ky -- ri --
  e "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 g'^\tutti h
    a r8 fis fis4
    g r8 g h[ g]~
    g e r a cis[ a]~
    a fis r a fis a
    g4. g8 g4~
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- lei -- son,
  Ky -- ri -- e
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 h4. d8
    d4 r8 a a[ d]
    d4 r8 d h[ d]
    c r r e cis[ e]
    d4 d d
    d2 d4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, Ky -- ri --
  e "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 g'4.^\tutti g,8
    d'4 r8 d d'[ d,]
    g4 r8 g g[ h,]
    c r r a' a[ cis,]
    d4 r8 d'4 d,8
    g4 g4. g8
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, Ky -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Allegro"
    g8-\tutti g'~ g16 d h d g, d' h g
    d'4 r8 d d' d,
    g, g'~ g16 d h d g, d' h g
    c8 a'~ a16 e cis e a, e' cis a
    d8 d'~ d16 a fis a d, a' fis d
    g, h' g d h g' d h g h d g
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r8 <_+> r2
  r2.
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
