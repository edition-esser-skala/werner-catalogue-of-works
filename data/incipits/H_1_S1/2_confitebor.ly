\version "2.24.2"
\include "header.ly"

Cornetto = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 c'8 c
    c4 c8 c c8. c16 c4
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 g'8 g
    g4 g8 g a16 a a8 f16 g f g
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 e8 e
    e4 e8 e f16 f f8 a,16 b a b
  }
}

Fagotto = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 c'
    c c, f2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1
    r8 f'16(\p e) f4 r2
    r8 a16( g) a4 r2
    r8 b16( a) b4 r2
    r r8 c16\f h c4
    c2 r8 a16( g) a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    R1
    r8 a'16(\p g) a4 r2
    r8 f'16 e f8 a, r2
    r8 g'16( fis) g4 r2
    r r8 e16(\f d) e4
    e2 r8 f16( e) f4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    c'8^\solo a16[ b] c8 d c b16[ a] b8. b16
    a4 r8 c c16[ d] c[ d] c[ d] c[ d]
    c8 f, r d'16 d d[ es] d[ \hA es] d[ \hA es] d[ \hA es]
    d8 g, r c a b16[ c] d[ e] c[ d]
    h[ g c d] d4 c c8^\tutti c
    c4 c8 c c8. c16 c4
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi, Do -- mi --
  ne, in to -- to cor -- de
  me -- o, in con -- si -- li -- o iu --
  sto -- rum, et con -- gre -- ga -- ti --
  o -- ne. Ma -- gna
  o -- pe -- ra Do -- mi -- ni:
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 g'8^\tutti g
    g4 g8 g a16 a a8 f16[ g] f[ g]
  }
}

AltoLyrics = \lyricmode {
  Ma -- gna
  o -- pe -- ra Do -- mi -- ni: Ex -- "qui -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 e8^\tutti e
    e4 e8 e f16 f f8 a,16[ b] a[ b]
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gna
  o -- pe -- ra Do -- mi -- ni: Ex -- "qui -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    r2 r4 c'8^\tutti c
    c4 c,8 c f8. f16 f4
  }
}

BassoLyrics = \lyricmode {
  Ma -- gna
  o -- pe -- ra Do -- mi -- ni:
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    f4.-\solo b,8 f'4 d8 e
    f4 r8 e f a e c
    f4 r8 fis g b fis d
    g4 r8 e f e d f
    g e f g c,4 c'-\tutti
    c c, f2
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r4. q r4
  r4. <6> r4
  r1
  <_!>4 <6 5>8 <_!> r2
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff \with { \smallStaffDistance } {
        \set Staff.instrumentName = "cnto"
        \Cornetto
      }
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "fag"
        \Fagotto
      }
    >>
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
