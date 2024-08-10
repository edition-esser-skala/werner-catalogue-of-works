\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    r8 g'\f\trill h\trill d\trill g\trill c,\trill e\trill g\trill
    h h, d e f f f( e)
    e4. e8 fis fis fis16 e fis8
    h, h h h e4 r8 e
    c f r f e a r a
    g8.\trill a32 h c8 h a4 g
    fis!4.\trill fis8 e4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    r8 g'\trill\f h\trill d\trill g\trill c,\trill e\trill g\trill
    h gis, h c d d d4\trill
    c4. c8 dis dis dis4\trill
    e8 h gis e c'4 r8 c
    a d r d c f r f
    e4. e8 dis4 e~
    e dis e r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    h'4.^\tutti h8 c4 c8 e
    d4 d8 e f f f[ e]
    e4 c dis8 dis dis4\trill
    e2 r8 e4 c8
    c[ a] d!4 c4. f8
    e4 e dis8 dis e e
    e4 dis e h~^\solo
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- se -- re -- re
  no -- _ bis. "A -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti g8 g4 g8 e
    gis4 gis8 a h h h4~
    h8[ a] a a a a a4~
    a8[ gis16 fis] gis4 r8 g4 g8
    a4 f e a
    g8.[ a32 h] c8[ h] a4 g
    fis2 e4 r
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re no -- _
  _ bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4.^\tutti d8 c4 g8 g
    h4 h8 c d d d4
    c4. e8 fis! fis fis4
    h,2 r8 c4 c8
    a2 a8 c4 c8
    c4. e8 fis!4 h,
    c h h r
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re no -- bis,
  no -- _ bis.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4^\tutti f e e8 c
    h4 h8 a gis gis gis4
    a a' fis!8 fis fis4
    e2 r8 c4 c8
    f4 d a' f
    c'8.[ h16] a8[ g] fis4 e
    a, h e2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re no -- _
  _ _ bis.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g'4-\tutti f e4. c8
    h4. a8 gis4 gis
    a a' fis!2
    e r8 c4 c8
    f4 d a' f
    c'8. h16 a8 g fis4 e
    a, h e~ e-\solo
  }
}

BassFigures = \figuremode {
  r4 <6 4 2> <6>2
  <6\\>4. <5 3>8 <7! 5>4 <\t \t>8 <6 \t>
  <9> <8>4. <6\\>2
  <4>4 <_+>2.
  r1
  r2 <6\\>
  <6 5>4 <_+>2.
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
