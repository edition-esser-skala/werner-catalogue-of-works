\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 c'8^\solo e d g, g f
    e8. f16 g8 c a c g c
    f,4. e8 d4 r
    r2 r8 g a d16 c
    h8 h cis d e f!16 g f8 e
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor -- de
  me -- _ o.
  Con -- fes -- si -- o
  et ma -- gni -- fi -- cen -- ti -- a o -- pus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r8 g'4^\solo e8 c8. c16 c8 c~
    c[ h16 c] d8 c h4 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  Ma -- gna o -- pe -- ra Do --
  _ mi -- ni:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r4 g8^\solo g g a16 h c[ d e f]
    g8 e c c c h a4
    g r r a8 a
  }
}

TenoreLyrics = \lyricmode {
  Ex -- qui -- si -- ta in o --
  _ mnes vo -- lun -- ta -- tes e --
  ius. Et "iu -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r8 h'4^\solo g8
    c c,16[ d] e8 c f4 e8 e
    d d' h c g g r4
    R1*2
  }
}

BassoLyrics = \lyricmode {
  In con --
  si -- li -- o iu -- sto -- rum, et
  con -- gre -- ga -- ti -- o -- ne.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    c8-\solo d e c h4. g8
    c, c'16 d e8 c f4 e
    d8 d' h c g f e d
    c4. e8 d g d4
    g8 f! e d cis4 r8 cis'
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  <7>8 <6> <6 5>2.
  r2 <7 _+>4 <4>8 <_+>
  r4 <6\\>2.
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
