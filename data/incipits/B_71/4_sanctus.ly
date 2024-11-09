\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    r8 f-!^\markup \remark "staccato" a-! c-! g b c e
    f, a b d e, g a c
    b d g, c a a' b, g'
    a, b c a' h, gis' a c,
    e, a' h, gis' a, e' a c
    d d, d, c' h d g b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    r8 f-!^\markup \remark "staccato" a-! c-! g b c e
    f, a b d e, g a c
    b d g, c a a' b, g'
    a, b c a' h, gis' a c,
    e, a' h, gis' a, e' a c
    d d, d, c' h d g b
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*2
    r2 r4 d'~^\tutti
    d c h c
    h2 a4 c~
    c c h b
  }
}

SopranoLyrics = \lyricmode {
  San --
  ctus, san -- ctus,
  san -- ctus Do --
  mi -- nus, "Do -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    f2.^\tutti e4
    d2 c
    d4 e fis g
    fis8[ g] a4 gis a~
    a8[ gis16 fis] \hA gis4 a a~
    a8 a a4 g8 g g4
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus, san -- _
  _ ctus, san -- _
  _ ctus Do --
  mi -- nus De -- us, "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1
    r4 b2^\tutti a4
    g c2 b4
    a2 r4 e'~
    e d c2
    d8. d16 d4 d d
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- _ _
  ctus, san --
  _ ctus
  Do -- mi -- nus De -- us,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1
    r2 r4 f~^\tutti
    f e d2~
    d4 d e2~
    e a,
    fis'4. fis16 fis g4 g
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san --
  ctus, san --
  ctus
  Do -- mi -- nus De -- us,
}

Organo = {
  \relative c {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    f'2.-\tutti e4
    d \clef tenor b2 \clef bass f4~
    f e d2~
    d4 d e2~
    e a,
    fis' g
  }
}

BassFigures = \figuremode {
  <5 3>2 <4 2>4 <6>
  <5>1
  <6 4 2>4 <6> <7 _+> <6 4>
  <8 _+> <7 \t> <5 _+> <6 4>
  <8 5 4> <7 \t _+>2.
  <6 5>2 <_!>4 <_->
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
