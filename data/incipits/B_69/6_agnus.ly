\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo moderato"
    r2 e'8 g a f
    d16( c) d8 r4 r8 e e16 f g8
    f16( e) f8 r4 r8 fis fis16 g a8
    g16 fis g8 r h, e16 fis g8~ g \hA fis16 e
    dis4 r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo moderato"
    r2 c'8 e16 d c8 d16 c
    h( a) h8 r4 r8 cis cis16 d e8
    a,16( g) a8 r4 r8 dis dis16 e fis8
    h,16( a) h8 g fis g8. e16 ais16( gis) \hA ais8
    h4 r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo moderato"
    g'8^\solo c h16[ c] d8 c16[ h] c8 r4
    r8 g g a16 b a[\trill g a8] a4
    r8 a a h16 c h[\trill a h8] h4
    r8 h c h e4 e,\trill
    fis r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus, a -- gnus De -- i,
  qui tol -- lis pec -- ca -- ta,
  qui tol -- lis pec -- ca -- ta,
  pec -- ca -- ta mun -- _
  di:
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo moderato"
    R1*4
    h'8^\solo h h, a' gis16[ fis] \hA gis8 r4
    r2 r4 a
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re no -- bis,
  "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo moderato"
    R1*4
    r2 e8^\solo e e, d'
    c16[ h] c8 e4. d8 d c
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- re -- re
  no -- bis, mi -- se -- re -- re
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo moderato"
    R1*5
    a'8^\solo a a, g' fis4 fis
  }
}

BassoLyrics = \lyricmode {
  Mi -- se -- re -- re no -- bis,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo moderato"
    c4-\solo d e f
    g8 f e d cis a r4
    d f8 e dis h r4
    e4. d8 c!2
    h4 dis e gis
    a8 a a, g' fis2
  }
}

BassFigures = \figuremode {
  r4 <6> q <5>8 <6>
  r4 <6>8 <6-> <6>2
  r4 <6>8 <6> <6>2
  r4 <6>8 <6 _+> <7>4 <6\\>
  <_+> <6>8 <5> <_+>4 <6>8 <5>
  r4. <6>8 <7>4 <6>
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
