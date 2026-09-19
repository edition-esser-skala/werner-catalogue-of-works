\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    r2 r16 a'\p f16.( a32) f16.( a32) f16.( a32)
    d,4 r r16 g e16.( g32) e16.( g32) e16.( g32)
    es4 r r16 d'\f h16.( d32) r16 g e16.( g32)
    r16 f d16.( f32) r16 d h16.( d32) r2
    r8 e~ e16 d c h a8 d~ d16 c h a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    r2 r16 f\p d16.( f32) d16.( f32) d16.( f32)
    h,4 r r16 e c16.( e32) c16.( e32) c16.( e32)
    c4 r r16 h'\f g16.( h32) r16 e cis16.( e32)
    r16 a, f16.( a32) r16 h gis16.( h32) r2
    r4 a8. g16 f e d8 g8. f16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2
    c'8^\tutti c c8. c16 h8 r cis r
    d r d r c c c8. c16
    h8 e8. d16 c h a8[ d]~ d16[ c h a]
  }
}

SopranoLyrics = \lyricmode {
  Pax ho -- mi -- ni -- bus, pax,
  pax, pax, pax ho -- mi -- ni --
  bus bo -- nae vo -- lun -- ta \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2
    a'8^\tutti a a8. a16 g8 r g r
    f r gis r a a fis8. fis16
    gis4 a8. g16 f e d8 g8.[ f16]
  }
}

AltoLyrics = \lyricmode {
  Pax ho -- mi -- ni -- bus, pax,
  pax, pax, pax ho -- mi -- ni --
  bus bo -- nae vo -- lun -- ta \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2
    es8^\tutti es es8. es16 d8 r e r
    a, r h r e a, a8. a16
    gis4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Pax ho -- mi -- ni -- bus, pax,
  pax, pax, pax ho -- mi -- ni --
  bus
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    a'8^\solo e c' a, f'4 r
    h8 g d' g,, e'4 r
    fis8^\tutti fis fis8. fis16 g8 r e r
    d r h r a f' dis8. dis16
    e4 r r2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra pax,
  et in ter -- ra pax,
  pax ho -- mi -- ni -- bus, pax,
  pax, pax, pax ho -- mi -- ni --
  bus
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    a'4-\solo a, d r
    g g, c r
    fis4.-\tutti fis8 g r e r
    d r h r a-\markup \remark "con Pedale" r dis r
    e \clef soprano << { e''~ e16 d c h a8 d~ d16 c h a } \\ { r8 a8. g16 f e d8 g8. f16 } >>
  }
}

BassFigures = \figuremode {
  r1
  r
  <7- 5>2. <6\\>4
  r q <> <6>
  <_+>1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
