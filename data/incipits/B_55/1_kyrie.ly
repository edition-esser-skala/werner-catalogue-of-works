\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d16\f fis a d fis8 a e,16 a cis e a8 e
    fis16 d a fis d8 r r e'4\p g8
    r16 fis, a d fis8 fis, r16 gis\f h gis e' h gis' e
    h'8 h, r4 r16 e,\f a e cis' a e' cis
    a'8 a, r4 r16 g\f h g d' h g' d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d16\f fis a d fis8 a e a, r4
    r d16 a fis d a8 cis'4\p e8
    r16 d, fis a d8 d, r16 e\f gis e h' gis e' h
    gis'8 gis, r4 r16 cis,\f e cis a' e cis' a
    fis'8 fis, r4 r16 d\f g d h' g d' h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'8.^\tutti a16 a8 d d cis r e
    e d r fis,\p fis e r g
    g fis r fis' gis,2~
    gis\p e'\f
    fis,\p d'\f
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  _
  _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    fis8.^\tutti fis16 a8 fis fis e r g
    g fis r d\p d cis r e
    e d r4 r8 h\f e4~
    e\p e r8 e\f a a
    r a\p d, d r d\f g g
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d8.^\tutti d16 d8 a a a r cis
    a a r a\p a a r cis
    a a r4 r8 h\f h h
    r h\p h h r a\f e' e
    r a,\p a a r g\f h h
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d8.^\tutti d16 fis8 d a' a, r a
    d d r d\p a' a, r a
    d d r4 r8 e\f e e
    r d\p d d r cis\f cis cis
    r c\p c c r h\f h h
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d8 d' fis, d a' a, cis a
    d d'\p fis, d a' a, cis a
    d4 r r8 e\f e e
    r d\p d d r cis\f cis cis
    r c\p c c r h\f h h
  }
}

BassFigures = \figuremode {
  r2 <4>8 <3>4.
  <9 4>8 <8 3>4. <6 4>8 <5 3>4 <7 5>8
  <9 4> <8 3>2 <_+>4.
  r8 <6 4\+>2 <6>4.
  r8 <4 2>2 <6>4.
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
