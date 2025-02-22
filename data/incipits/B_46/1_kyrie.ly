\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r8 h'16\f c d8 a h g r4
    r8 e'\p g c r d, g h
    r c, fis a r h, d g
    r4 g2\f fis4~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r8 g'4\f fis8 g h, r4
    r r8 e'\p d g, r d'
    c e, r c' h g r4
    r h\f e a,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d'8.^\tutti d16 d8 d d[ g] d4~
    d8[ g] d4. h16[ c] d8[ a]
    h g r4 r r8 g\p
    e'2 d
    c h4 d\f
    g2. fis4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  _ _ _
  _ son, e --
  lei -- _
  _ son, e --
  lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'8.^\tutti g16 g8 a g4. a8
    g4. a8 g g4 fis8
    g4 r r2
    r8 e\p g e r g d g
    r e a fis r d g g
    r4 h,\f e d
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son,  e -- lei -- _ _
  son,
  e -- lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
  e -- lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    h8.^\tutti h16 h8 a h4. a8
    h4. a8 h16[ c] d4~ d8
    d4 r r8 g,\p d'4~
    d c2 h4~
    h a2 g4
    r g\f a2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei -- _
  son, e -- lei --
  _ _
  _ son,
  e -- "lei -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'8.^\tutti g16 g8 fis g4. fis8
    g4. fis8 g[ g, h d]
    g,4 r r2
    r8 c\p e c r g' h g
    r a fis d r g h g
    r4 e\f cis d
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei --
  son,
  e -- lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
  e -- lei \hy
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    g'4.-\tutti fis8 g4. fis8
    g4. fis8 g g, h d
    g g, h d g,4 r
    r8 c\p e c r g' h g
    r a fis d r g h, g
    r4 e'\f cis d
  }
}

BassFigures = \figuremode {
  r4. <6>2 q8
  r4. q8 r2
  r1
  r8 <9> <6>4. <5 4>8 <6>4
  r8 <3 9> <5> <7>4 <9>8 <6>4
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
