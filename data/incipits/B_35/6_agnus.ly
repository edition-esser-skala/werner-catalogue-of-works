\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    d'4 g2 f4
    e8 e a4. a8 g4
    fis!8 h fis gis a a4 a8
    a a,~ a16 gis a8 \hA gis4 r
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    r8 h' d h a d a h
    c e4 c8 h4. cis8
    d4. c16 h c8 c4 c8
    c c~ c16 h c8 h4 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 h'[^\tutti d] h a[ d] a h
    c e4 c8 h4. cis8
    d4. c16[ h] c8 c4 c8
    c c c16[ h c8] h4 r
    R1
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di: Mi -- se --
  re -- re no -- bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4^\tutti g g f
    e8 e a4. a8 g4
    fis!8 h fis[ gis] a a4 a8
    a fis a16[ gis a8] \hA gis4 r
    R1
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- ta mun -- di: Mi -- se --
  re -- re no -- bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g4^\tutti h d2
    c8 c e4. e,8 e e'
    d d h4 e, r
    r2 r8 e'4^\solo e,8
    c'16[ h] c4 e16[ c] a8[ cis] e f
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol -- _ lis pec --
  ca -- ta mun -- di:
  A -- gnus
  De -- i, qui tol -- lis "pec -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti g8 d2
    a'4 r8 a, e'4 e8 e
    h2 a4 f'8 f
    dis dis dis4 e r
    R1
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol -- lis pec --
  ca -- ta: Mi -- se --
  re -- re no -- bis.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g'2-\tutti d
    a'8 a, c a e'2
    h a4 f'
    dis2 e4 r
    e2-\solo cis
  }
}

BassFigures = \figuremode {
  r2 <5 4>4 <\t _!>
  r2 <5 4>4 <\t 3>8 <6\\ \t>
  <5>4. <6\\> <5>4
  <7 5>2 <_+>
  <6> <6>
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
