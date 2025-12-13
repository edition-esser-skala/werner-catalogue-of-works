\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    a'2 f'4 d,
    r b'2 a4
    gis2 a8 a e'4~
    e8 d d4 r r8 g,
    d'2~ d8 c16 d c8 h
    a4 a f' d,8 f
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    r2 d
    b'4 g, r f'~
    f e8 d cis a16 h \hA cis d e8
    a, d a'4~ a8 g g4
    r d h' gis,
    r2 r8 d' a'4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    a'2^\aQuattro f'4 d,
    r b'2 a4
    gis2 a8 a e'4~
    e8[ d] d4 r r8 g,
    d'2~ d8[ c16 d] c8[ h]
    a4 a f' d,8 f
  }
}

SopranoLyrics = \lyricmode {
  In mon -- te
  O -- li --
  ve -- ti o -- ra --
  bat, o --
  ra -- _
  bat, in mon -- te "o -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r2 d
    b'4 g, r f'~
    f e8[ d] cis[ a16 h] \hA cis[ d e8]
    a, d a'4~ a8[ g] g4
    r d h' gis,
    r2 r8 d' a'4
  }
}

AltoLyrics = \lyricmode {
  In
  mon -- te O --
  li -- ve -- _
  ti o -- ra -- bat,
  in mon -- te
  o -- "ra -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    R1*2
    r2 a
    f'4 d, r b'~
    b a gis2
    a8 a e'4~ e8[ d] d4
  }
}

TenoreLyrics = \lyricmode {
  In
  mon -- te O --
  li -- ve --
  ti o -- ra -- bat,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    R1*3
    d2 b'4 g,
    r4 f'2 e8[ d]
    cis2 d4 r8 d
  }
}

BassoLyrics = \lyricmode {
  In mon -- te
  O -- li --
  ve -- ti "o -"
}

Cembalo = {
  \relative c {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    << {
      a''2^\aQuattro f'4 d,
      r b'2 a4
      gis
    } \\ {
      r2 d
      b'4 g, r f'~
      f e8 d
    } >> \clef tenor a2
    \clef bass d, b'4 g,
    r f'2 e8 d
    cis2 d4 r8 d
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <_+>
  <10 9>8 <\t 8>4. <7>8 <6>4.
  r4 <6> <4! 2\+> <_+>4
  r2 <9>8 <8>4.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
