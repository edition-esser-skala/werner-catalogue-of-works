\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    R1*5
    r4 d'8 d e4 g8 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    R1*4
    r2 r4 a'8 a
    h4 d8 h g4 e'~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\solo a8 gis4 a8 h
    c4 d8 e f4 a,
    gis2 a4 r
    r2 r4 g8 a16[ h]
    c4. h8 a2
    g4 r r2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se --
  re -- re no --
  bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*3
    d8^\solo e f2 e4
    e8 fis16[ g] a8 g g4 fis
    g r r2
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re no -- _
  bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*2
    r2 a8^\solo h c4~
    c h c8 g c h
    a[ g] fis[ g] d'2
    d4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- re --
  re no -- bis, mi -- se --
  re -- re no --
  bis.
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*4
    r2 r4 d8^\solo d
    g4 h8 g c4 c,8 c'
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis "pec -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    a8-\solo a' g f e d c h
    a g' f e d e f d
    e h' e d c h a g
    f e d g c,4 \clef tenor c'8 h
    a g fis g d'4 \clef bass d,
    g h8 g c4 c,
  }
}

BassFigures = \figuremode {
  r2 <_+>
  r1
  <5 4>4 <\t _+> r2
  <6 5>4 <6>8 <7> <4>4 <3>
  r2 <5 4>4 <\t _+>
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
